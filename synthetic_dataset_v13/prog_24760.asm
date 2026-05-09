; DESCRIPTION: Draws a purple rectangle at (378, 88) with width 43 and height 85.
; PLAN: r0=378(x), r1=88(y), r2=43(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 88
LDI r2, 43
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
