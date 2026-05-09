; DESCRIPTION: Renders a black disk with center (32, 204) and radius 23.
; PLAN: r0=32(x), r1=204(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 204
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
