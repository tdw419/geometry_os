; DESCRIPTION: Draws a magenta rectangle at (287, 155) with width 88 and height 30.
; PLAN: r0=287(x), r1=155(y), r2=88(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 155
LDI r2, 88
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
