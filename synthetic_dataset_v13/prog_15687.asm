; DESCRIPTION: Draws a blue rectangle at (119, 88) with width 18 and height 58.
; PLAN: r0=119(x), r1=88(y), r2=18(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 88
LDI r2, 18
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
