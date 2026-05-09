; DESCRIPTION: Draws a blue rectangle at (43, 22) with width 89 and height 69.
; PLAN: r0=43(x), r1=22(y), r2=89(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 22
LDI r2, 89
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
