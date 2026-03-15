// hello_geos.c - Minimal RISC-V program that outputs "GEOS" via UART

volatile unsigned char *UART = (unsigned char *)0x1000;

void putchar(char c) {
    *UART = c;
}

void puts(const char *s) {
    while (*s) {
        putchar(*s++);
    }
}

void _start() {
    puts("GEOS\n");
    // Infinite loop
    while (1) {}
}
