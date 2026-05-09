; DESCRIPTION: Draws a blue rectangle at (74, 88) with width 29 and height 89.
; PLAN: r0=74(x), r1=88(y), r2=29(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 88
LDI r2, 29
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
