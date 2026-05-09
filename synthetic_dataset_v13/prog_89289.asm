; DESCRIPTION: Draws a blue rectangle at (68, 136) with width 86 and height 51.
; PLAN: r0=68(x), r1=136(y), r2=86(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 136
LDI r2, 86
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
