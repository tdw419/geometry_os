; DESCRIPTION: Draws a yellow rectangle at (145, 118) with width 49 and height 119.
; PLAN: r0=145(x), r1=118(y), r2=49(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 118
LDI r2, 49
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
