; DESCRIPTION: Draws a blue rectangle at (133, 199) with width 88 and height 25.
; PLAN: r0=133(x), r1=199(y), r2=88(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 199
LDI r2, 88
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
