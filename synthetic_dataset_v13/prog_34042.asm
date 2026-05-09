; DESCRIPTION: Draws a blue rectangle at (402, 17) with width 73 and height 118.
; PLAN: r0=402(x), r1=17(y), r2=73(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 17
LDI r2, 73
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
