; DESCRIPTION: Renders a yellow disk with center (422, 189) and radius 58.
; PLAN: r0=422(x), r1=189(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 189
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
