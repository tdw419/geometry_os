; DESCRIPTION: Draws a orange rectangle at (88, 5) with width 101 and height 118.
; PLAN: r0=88(x), r1=5(y), r2=101(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 5
LDI r2, 101
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
