; DESCRIPTION: Renders a black disk with center (93, 99) and radius 80.
; PLAN: r0=93(x), r1=99(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 99
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
