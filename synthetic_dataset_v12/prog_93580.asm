; DESCRIPTION: Draws a purple rectangle at (136, 94) with width 106 and height 92.
; PLAN: r0=136(x), r1=94(y), r2=106(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 94
LDI r2, 106
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
