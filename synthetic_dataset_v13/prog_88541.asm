; DESCRIPTION: Places a yellow 49x114 rectangle at position (318, 65).
; PLAN: r0=318(x), r1=65(y), r2=49(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 65
LDI r2, 49
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
