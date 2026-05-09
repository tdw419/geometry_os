; DESCRIPTION: Draws a orange rectangle at (120, 101) with width 118 and height 75.
; PLAN: r0=120(x), r1=101(y), r2=118(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 101
LDI r2, 118
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
