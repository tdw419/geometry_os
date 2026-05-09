; DESCRIPTION: Draws a purple rectangle at (20, 55) with width 96 and height 89.
; PLAN: r0=20(x), r1=55(y), r2=96(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 55
LDI r2, 96
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
