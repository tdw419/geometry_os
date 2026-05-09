; DESCRIPTION: Draws a blue rectangle at (55, 91) with width 88 and height 51.
; PLAN: r0=55(x), r1=91(y), r2=88(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 91
LDI r2, 88
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
