; DESCRIPTION: Draws a orange circle centered at (159, 45) with radius 17.
; PLAN: r0=159(x), r1=45(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 45
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
