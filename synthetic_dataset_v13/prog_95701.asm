; DESCRIPTION: Draws a magenta rectangle at (97, 14) with width 118 and height 110.
; PLAN: r0=97(x), r1=14(y), r2=118(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 14
LDI r2, 118
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
