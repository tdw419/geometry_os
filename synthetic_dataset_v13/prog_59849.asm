; DESCRIPTION: Renders a black disk with center (125, 93) and radius 76.
; PLAN: r0=125(x), r1=93(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 93
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
