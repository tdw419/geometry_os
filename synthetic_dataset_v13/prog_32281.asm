; DESCRIPTION: Renders a black disk with center (433, 87) and radius 51.
; PLAN: r0=433(x), r1=87(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 87
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
