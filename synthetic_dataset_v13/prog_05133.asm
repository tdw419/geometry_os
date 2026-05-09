; DESCRIPTION: Renders a black disk with center (218, 105) and radius 71.
; PLAN: r0=218(x), r1=105(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 105
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
