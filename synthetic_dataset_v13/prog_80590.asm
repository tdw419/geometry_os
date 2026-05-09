; DESCRIPTION: Draws a yellow rectangle at (22, 166) with width 111 and height 56.
; PLAN: r0=22(x), r1=166(y), r2=111(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 166
LDI r2, 111
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
