; DESCRIPTION: Draws a green rectangle at (88, 0) with width 101 and height 23.
; PLAN: r0=88(x), r1=0(y), r2=101(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 0
LDI r2, 101
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
