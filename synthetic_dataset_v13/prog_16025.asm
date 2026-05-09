; DESCRIPTION: Draws a orange rectangle at (186, 75) with width 102 and height 106.
; PLAN: r0=186(x), r1=75(y), r2=102(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 75
LDI r2, 102
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
