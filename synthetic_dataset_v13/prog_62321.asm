; DESCRIPTION: Draws a green rectangle at (153, 158) with width 96 and height 88.
; PLAN: r0=153(x), r1=158(y), r2=96(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 158
LDI r2, 96
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
