; DESCRIPTION: Draws a yellow rectangle at (265, 1) with width 118 and height 36.
; PLAN: r0=265(x), r1=1(y), r2=118(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 1
LDI r2, 118
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
