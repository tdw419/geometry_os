CC = riscv64-unknown-elf-gcc
CFLAGS = -march=rv32i -mabi=ilp32 -nostdlib -static -O2

all: hello_geos.elf hello_geos.bin

hello_geos.elf: hello_geos.c
	$(CC) $(CFLAGS) -T link.ld -o $@ $<

hello_geos.bin: hello_geos.elf
	riscv64-unknown-elf-objcopy -O binary $< $@

clean:
	rm -f *.elf *.bin

.PHONY: all clean
