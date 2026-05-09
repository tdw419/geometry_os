; DESCRIPTION: Draws a purple rectangle at (106, 138) with width 110 and height 87.
; PLAN: r0=106(x), r1=138(y), r2=110(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 138
LDI r2, 110
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
