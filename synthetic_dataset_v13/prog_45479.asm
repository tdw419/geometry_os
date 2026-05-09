; DESCRIPTION: Draws a purple rectangle at (395, 118) with width 33 and height 81.
; PLAN: r0=395(x), r1=118(y), r2=33(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 118
LDI r2, 33
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
