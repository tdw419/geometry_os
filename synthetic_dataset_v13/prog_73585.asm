; DESCRIPTION: Draws a orange rectangle at (309, 122) with width 110 and height 20.
; PLAN: r0=309(x), r1=122(y), r2=110(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 122
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
