; DESCRIPTION: Draws a yellow rectangle at (162, 75) with width 111 and height 43.
; PLAN: r0=162(x), r1=75(y), r2=111(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 75
LDI r2, 111
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
