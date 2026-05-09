; DESCRIPTION: Draws a orange rectangle at (10, 29) with width 118 and height 87.
; PLAN: r0=10(x), r1=29(y), r2=118(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 29
LDI r2, 118
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
