; DESCRIPTION: Draws a blue rectangle at (55, 136) with width 87 and height 35.
; PLAN: r0=55(x), r1=136(y), r2=87(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 136
LDI r2, 87
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
