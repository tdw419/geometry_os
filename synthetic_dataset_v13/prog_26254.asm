; DESCRIPTION: Renders a black disk with center (65, 51) and radius 45.
; PLAN: r0=65(x), r1=51(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 51
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
