; DESCRIPTION: Draws a yellow rectangle at (96, 15) with width 106 and height 101.
; PLAN: r0=96(x), r1=15(y), r2=106(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 15
LDI r2, 106
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
