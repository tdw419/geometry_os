; DESCRIPTION: Draws a yellow rectangle at (232, 106) with width 55 and height 62.
; PLAN: r0=232(x), r1=106(y), r2=55(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 106
LDI r2, 55
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
