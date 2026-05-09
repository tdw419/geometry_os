; DESCRIPTION: Draws a purple rectangle at (155, 140) with width 31 and height 101.
; PLAN: r0=155(x), r1=140(y), r2=31(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 140
LDI r2, 31
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
