; DESCRIPTION: Draws a blue rectangle at (106, 99) with width 91 and height 88.
; PLAN: r0=106(x), r1=99(y), r2=91(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 99
LDI r2, 91
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
