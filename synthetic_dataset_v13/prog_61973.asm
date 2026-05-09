; DESCRIPTION: Draws a magenta rectangle at (341, 91) with width 35 and height 88.
; PLAN: r0=341(x), r1=91(y), r2=35(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 91
LDI r2, 35
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
