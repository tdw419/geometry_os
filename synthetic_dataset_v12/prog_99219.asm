; DESCRIPTION: Draws a orange circle centered at (334, 87) with radius 15.
; PLAN: r0=334(x), r1=87(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 87
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
