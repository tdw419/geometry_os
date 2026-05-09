; DESCRIPTION: Renders a black disk with center (56, 192) and radius 10.
; PLAN: r0=56(x), r1=192(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 192
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
