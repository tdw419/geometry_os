; DESCRIPTION: Renders a black disk with center (124, 98) and radius 15.
; PLAN: r0=124(x), r1=98(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 98
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
