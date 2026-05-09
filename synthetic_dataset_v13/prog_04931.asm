; DESCRIPTION: Draws a yellow rectangle at (134, 135) with width 112 and height 118.
; PLAN: r0=134(x), r1=135(y), r2=112(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 135
LDI r2, 112
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
