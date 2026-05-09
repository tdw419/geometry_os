; DESCRIPTION: Renders a green disk with center (409, 227) and radius 23.
; PLAN: r0=409(x), r1=227(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 227
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
