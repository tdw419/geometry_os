; DESCRIPTION: Draws a orange rectangle at (461, 81) with width 22 and height 112.
; PLAN: r0=461(x), r1=81(y), r2=22(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 81
LDI r2, 22
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
