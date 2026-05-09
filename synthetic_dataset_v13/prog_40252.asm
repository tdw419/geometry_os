; DESCRIPTION: Places a black circle of radius 51 at center (133, 72).
; PLAN: r0=133(x), r1=72(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 72
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
