; DESCRIPTION: Draws a purple rectangle at (89, 56) with width 35 and height 110.
; PLAN: r0=89(x), r1=56(y), r2=35(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 56
LDI r2, 35
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
