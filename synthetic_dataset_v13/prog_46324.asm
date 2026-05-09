; DESCRIPTION: Draws a blue rectangle at (155, 87) with width 106 and height 112.
; PLAN: r0=155(x), r1=87(y), r2=106(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 87
LDI r2, 106
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
