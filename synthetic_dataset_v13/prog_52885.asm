; DESCRIPTION: Draws a purple rectangle at (147, 158) with width 88 and height 34.
; PLAN: r0=147(x), r1=158(y), r2=88(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 158
LDI r2, 88
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
