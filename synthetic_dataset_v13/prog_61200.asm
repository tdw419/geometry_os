; DESCRIPTION: Draws a orange rectangle at (77, 110) with width 62 and height 56.
; PLAN: r0=77(x), r1=110(y), r2=62(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 110
LDI r2, 62
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
