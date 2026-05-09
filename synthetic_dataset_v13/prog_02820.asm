; DESCRIPTION: Draws a orange rectangle at (110, 100) with width 62 and height 74.
; PLAN: r0=110(x), r1=100(y), r2=62(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 100
LDI r2, 62
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
