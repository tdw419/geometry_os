; DESCRIPTION: Draws a black rectangle at (318, 58) with width 88 and height 23.
; PLAN: r0=318(x), r1=58(y), r2=88(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 58
LDI r2, 88
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
