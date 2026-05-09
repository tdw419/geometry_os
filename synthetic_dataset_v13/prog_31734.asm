; DESCRIPTION: Draws a yellow rectangle at (101, 106) with width 100 and height 53.
; PLAN: r0=101(x), r1=106(y), r2=100(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 106
LDI r2, 100
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
