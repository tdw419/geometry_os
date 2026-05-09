; DESCRIPTION: Draws a blue rectangle at (232, 124) with width 101 and height 75.
; PLAN: r0=232(x), r1=124(y), r2=101(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 124
LDI r2, 101
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
