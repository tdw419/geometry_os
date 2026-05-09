; DESCRIPTION: Draws a purple rectangle at (5, 97) with width 55 and height 89.
; PLAN: r0=5(x), r1=97(y), r2=55(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 97
LDI r2, 55
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
