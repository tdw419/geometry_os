; DESCRIPTION: Draws a orange rectangle at (225, 44) with width 52 and height 115.
; PLAN: r0=225(x), r1=44(y), r2=52(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 44
LDI r2, 52
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
