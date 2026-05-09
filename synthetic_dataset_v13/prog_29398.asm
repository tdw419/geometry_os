; DESCRIPTION: Draws a yellow rectangle at (162, 101) with width 39 and height 63.
; PLAN: r0=162(x), r1=101(y), r2=39(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 101
LDI r2, 39
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
