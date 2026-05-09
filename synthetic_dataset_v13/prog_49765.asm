; DESCRIPTION: Draws a yellow rectangle at (149, 3) with width 119 and height 106.
; PLAN: r0=149(x), r1=3(y), r2=119(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 3
LDI r2, 119
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
