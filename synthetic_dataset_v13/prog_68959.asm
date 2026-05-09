; DESCRIPTION: Renders a yellow disk with center (273, 201) and radius 24.
; PLAN: r0=273(x), r1=201(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 201
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
