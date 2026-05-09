; DESCRIPTION: Draws a orange circle centered at (158, 110) with radius 69.
; PLAN: r0=158(x), r1=110(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 110
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
