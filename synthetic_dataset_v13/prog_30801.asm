; DESCRIPTION: Draws a orange circle centered at (334, 43) with radius 39.
; PLAN: r0=334(x), r1=43(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 43
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
