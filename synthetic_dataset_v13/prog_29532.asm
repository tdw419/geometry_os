; DESCRIPTION: Draws a purple rectangle at (26, 88) with width 62 and height 99.
; PLAN: r0=26(x), r1=88(y), r2=62(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 88
LDI r2, 62
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
