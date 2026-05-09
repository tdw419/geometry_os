; DESCRIPTION: Draws a yellow rectangle at (155, 33) with width 62 and height 99.
; PLAN: r0=155(x), r1=33(y), r2=62(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 33
LDI r2, 62
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
