; DESCRIPTION: Draws a orange circle centered at (325, 185) with radius 53.
; PLAN: r0=325(x), r1=185(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 185
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
