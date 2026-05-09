; DESCRIPTION: Renders a black disk with center (178, 51) and radius 32.
; PLAN: r0=178(x), r1=51(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 51
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
