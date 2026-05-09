; DESCRIPTION: Places a yellow 99x18 rectangle at position (331, 32).
; PLAN: r0=331(x), r1=32(y), r2=99(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 32
LDI r2, 99
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
