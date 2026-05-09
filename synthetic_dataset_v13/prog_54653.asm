; DESCRIPTION: Draws a orange rectangle at (88, 77) with width 101 and height 102.
; PLAN: r0=88(x), r1=77(y), r2=101(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 77
LDI r2, 101
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
