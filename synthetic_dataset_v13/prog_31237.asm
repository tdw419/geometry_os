; DESCRIPTION: Draws a orange circle centered at (37, 110) with radius 15.
; PLAN: r0=37(x), r1=110(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 110
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
