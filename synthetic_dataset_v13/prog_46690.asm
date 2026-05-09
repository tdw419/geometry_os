; DESCRIPTION: Draws a yellow rectangle at (170, 5) with width 102 and height 66.
; PLAN: r0=170(x), r1=5(y), r2=102(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 5
LDI r2, 102
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
