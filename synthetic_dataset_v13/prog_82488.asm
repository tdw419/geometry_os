; DESCRIPTION: Draws a yellow rectangle at (118, 25) with width 73 and height 119.
; PLAN: r0=118(x), r1=25(y), r2=73(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 25
LDI r2, 73
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
