; DESCRIPTION: Draws a yellow circle centered at (53, 201) with radius 34.
; PLAN: r0=53(x), r1=201(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 201
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
