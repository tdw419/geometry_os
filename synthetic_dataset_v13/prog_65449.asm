; DESCRIPTION: Renders a yellow disk with center (409, 89) and radius 64.
; PLAN: r0=409(x), r1=89(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 89
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
