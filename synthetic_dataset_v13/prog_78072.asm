; DESCRIPTION: Renders a black disk with center (429, 189) and radius 48.
; PLAN: r0=429(x), r1=189(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 189
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
