; DESCRIPTION: Draws a blue rectangle at (216, 35) with width 81 and height 89.
; PLAN: r0=216(x), r1=35(y), r2=81(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 35
LDI r2, 81
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
