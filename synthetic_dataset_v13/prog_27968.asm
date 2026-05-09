; DESCRIPTION: Draws a magenta rectangle at (55, 80) with width 38 and height 88.
; PLAN: r0=55(x), r1=80(y), r2=38(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 80
LDI r2, 38
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
