; DESCRIPTION: Draws a yellow rectangle at (227, 172) with width 73 and height 75.
; PLAN: r0=227(x), r1=172(y), r2=73(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 172
LDI r2, 73
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
