; DESCRIPTION: Draws a purple rectangle at (97, 75) with width 112 and height 118.
; PLAN: r0=97(x), r1=75(y), r2=112(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 75
LDI r2, 112
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
