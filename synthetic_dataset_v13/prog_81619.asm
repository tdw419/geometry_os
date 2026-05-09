; DESCRIPTION: Draws a orange rectangle at (88, 118) with width 70 and height 89.
; PLAN: r0=88(x), r1=118(y), r2=70(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 118
LDI r2, 70
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
