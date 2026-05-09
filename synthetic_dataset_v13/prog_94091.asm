; DESCRIPTION: Draws a orange rectangle at (139, 137) with width 110 and height 91.
; PLAN: r0=139(x), r1=137(y), r2=110(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 137
LDI r2, 110
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
