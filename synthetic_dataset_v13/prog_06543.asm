; DESCRIPTION: Draws a blue rectangle at (337, 22) with width 100 and height 88.
; PLAN: r0=337(x), r1=22(y), r2=100(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 22
LDI r2, 100
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
