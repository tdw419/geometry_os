; DESCRIPTION: Places a black circle of radius 49 at center (140, 51).
; PLAN: r0=140(x), r1=51(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 51
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
