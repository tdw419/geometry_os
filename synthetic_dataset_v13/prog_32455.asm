; DESCRIPTION: Draws a orange rectangle at (273, 101) with width 35 and height 43.
; PLAN: r0=273(x), r1=101(y), r2=35(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 101
LDI r2, 35
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
