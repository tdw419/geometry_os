; DESCRIPTION: Places a yellow 96x101 rectangle at position (350, 59).
; PLAN: r0=350(x), r1=59(y), r2=96(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 59
LDI r2, 96
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
