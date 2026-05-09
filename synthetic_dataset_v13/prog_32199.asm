; DESCRIPTION: Draws a yellow rectangle at (188, 88) with width 77 and height 66.
; PLAN: r0=188(x), r1=88(y), r2=77(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 88
LDI r2, 77
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
