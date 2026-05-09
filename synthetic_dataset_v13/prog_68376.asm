; DESCRIPTION: Draws a purple rectangle at (115, 137) with width 86 and height 108.
; PLAN: r0=115(x), r1=137(y), r2=86(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 137
LDI r2, 86
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
