; DESCRIPTION: Draws a purple rectangle at (278, 30) with width 119 and height 118.
; PLAN: r0=278(x), r1=30(y), r2=119(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 30
LDI r2, 119
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
