; DESCRIPTION: Draws a yellow rectangle at (88, 53) with width 102 and height 101.
; PLAN: r0=88(x), r1=53(y), r2=102(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 53
LDI r2, 102
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
