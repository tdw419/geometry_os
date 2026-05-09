; DESCRIPTION: Draws a yellow rectangle at (111, 88) with width 117 and height 63.
; PLAN: r0=111(x), r1=88(y), r2=117(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 88
LDI r2, 117
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
