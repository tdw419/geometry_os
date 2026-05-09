; DESCRIPTION: Places a black circle of radius 26 at center (289, 53).
; PLAN: r0=289(x), r1=53(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 53
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
