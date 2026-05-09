; DESCRIPTION: Draws a yellow rectangle at (233, 2) with width 26 and height 62.
; PLAN: r0=233(x), r1=2(y), r2=26(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 2
LDI r2, 26
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
