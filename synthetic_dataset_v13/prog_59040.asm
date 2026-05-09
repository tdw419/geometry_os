; DESCRIPTION: Draws a purple rectangle at (30, 88) with width 103 and height 119.
; PLAN: r0=30(x), r1=88(y), r2=103(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 88
LDI r2, 103
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
