; DESCRIPTION: Draws a purple rectangle at (163, 78) with width 66 and height 66.
; PLAN: r0=163(x), r1=78(y), r2=66(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 78
LDI r2, 66
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
