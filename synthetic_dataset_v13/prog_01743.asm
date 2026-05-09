; DESCRIPTION: Draws a purple rectangle at (71, 181) with width 110 and height 66.
; PLAN: r0=71(x), r1=181(y), r2=110(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 181
LDI r2, 110
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
