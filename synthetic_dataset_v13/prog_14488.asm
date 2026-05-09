; DESCRIPTION: Draws a orange circle centered at (421, 45) with radius 33.
; PLAN: r0=421(x), r1=45(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 45
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
