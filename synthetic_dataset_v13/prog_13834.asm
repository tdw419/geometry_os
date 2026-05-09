; DESCRIPTION: Draws a blue rectangle at (216, 81) with width 79 and height 112.
; PLAN: r0=216(x), r1=81(y), r2=79(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 81
LDI r2, 79
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
