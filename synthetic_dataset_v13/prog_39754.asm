; DESCRIPTION: Draws a yellow rectangle at (76, 75) with width 106 and height 118.
; PLAN: r0=76(x), r1=75(y), r2=106(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 75
LDI r2, 106
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
