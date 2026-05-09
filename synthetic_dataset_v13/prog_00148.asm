; DESCRIPTION: Renders a black disk with center (193, 76) and radius 71.
; PLAN: r0=193(x), r1=76(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 76
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
