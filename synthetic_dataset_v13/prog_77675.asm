; DESCRIPTION: Renders a black disk with center (276, 131) and radius 51.
; PLAN: r0=276(x), r1=131(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 131
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
