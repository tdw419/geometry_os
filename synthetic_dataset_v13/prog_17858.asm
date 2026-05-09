; DESCRIPTION: Places a yellow 30x119 rectangle at position (181, 59).
; PLAN: r0=181(x), r1=59(y), r2=30(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 59
LDI r2, 30
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
