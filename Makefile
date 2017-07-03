# Changelog
# Changed the variables to include the header file directory
# Added global var for the XTENSA tool root
#
# This make file still needs some work.
#
#
# Output directors to store intermediate compiled files
# relative to the project directory
-include ../buildconfig.mk

vpath %.c mqtt

define compile-objects
$1/%.o: %.c
	$(vecho) "CC $$<"
	$(Q) $(CC) $(INCDIR) $(MODULE_INCDIR) $(EXTRA_INCDIR) $(SDK_INCDIR) $(CFLAGS)  -c $$< -o $$@
endef
CFLAGS += -Imqtt/include

all: libmqtt.a

OBJS = $(patsubst %.c,%.o,$(wildcard mqtt/*.c))
libmqtt.a: $(OBJS)
	$(vecho) ">>AR $@"
	$(Q) $(AR) cru $@ $^


clean:
	$(Q) rm -f libmqtt.a $(OBJS)
