; DESCRIPTION: Draws a orange rectangle at (172, 105) with width 118 and height 26.
; PLAN: r0=172(x), r1=105(y), r2=118(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 105
LDI r2, 118
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
