; DESCRIPTION: Draws a yellow rectangle at (396, 101) with width 100 and height 86.
; PLAN: r0=396(x), r1=101(y), r2=100(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 101
LDI r2, 100
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
