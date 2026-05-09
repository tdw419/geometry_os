; DESCRIPTION: Draws a orange rectangle at (342, 8) with width 118 and height 55.
; PLAN: r0=342(x), r1=8(y), r2=118(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 8
LDI r2, 118
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
