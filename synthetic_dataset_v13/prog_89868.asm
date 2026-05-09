; DESCRIPTION: Draws a purple rectangle at (386, 88) with width 118 and height 119.
; PLAN: r0=386(x), r1=88(y), r2=118(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 88
LDI r2, 118
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
