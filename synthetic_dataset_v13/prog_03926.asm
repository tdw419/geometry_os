; DESCRIPTION: Draws a green rectangle at (58, 52) with width 101 and height 17.
; PLAN: r0=58(x), r1=52(y), r2=101(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 52
LDI r2, 101
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
