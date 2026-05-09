; DESCRIPTION: Draws a yellow circle centered at (325, 201) with radius 41.
; PLAN: r0=325(x), r1=201(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 201
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
