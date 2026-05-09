; DESCRIPTION: Draws a orange rectangle at (35, 57) with width 118 and height 89.
; PLAN: r0=35(x), r1=57(y), r2=118(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 57
LDI r2, 118
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
