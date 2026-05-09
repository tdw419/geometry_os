; DESCRIPTION: Draws a blue rectangle at (136, 136) with width 80 and height 84.
; PLAN: r0=136(x), r1=136(y), r2=80(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 136
LDI r2, 80
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
