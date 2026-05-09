; DESCRIPTION: Renders a yellow disk with center (396, 201) and radius 36.
; PLAN: r0=396(x), r1=201(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 201
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
