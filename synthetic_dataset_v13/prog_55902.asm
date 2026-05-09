; DESCRIPTION: Draws a purple rectangle at (71, 106) with width 118 and height 115.
; PLAN: r0=71(x), r1=106(y), r2=118(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 106
LDI r2, 118
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
