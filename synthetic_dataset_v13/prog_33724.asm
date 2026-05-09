; DESCRIPTION: Draws a blue rectangle at (136, 55) with width 52 and height 17.
; PLAN: r0=136(x), r1=55(y), r2=52(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 55
LDI r2, 52
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
