; DESCRIPTION: Draws a yellow rectangle at (339, 30) with width 114 and height 105.
; PLAN: r0=339(x), r1=30(y), r2=114(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 30
LDI r2, 114
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
