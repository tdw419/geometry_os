; DESCRIPTION: Draws a purple rectangle at (142, 106) with width 77 and height 110.
; PLAN: r0=142(x), r1=106(y), r2=77(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 106
LDI r2, 77
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
