; DESCRIPTION: Places a black circle of radius 69 at center (194, 119).
; PLAN: r0=194(x), r1=119(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 119
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
