; DESCRIPTION: Draws a yellow rectangle at (191, 66) with width 118 and height 69.
; PLAN: r0=191(x), r1=66(y), r2=118(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 66
LDI r2, 118
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
