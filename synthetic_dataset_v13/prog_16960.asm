; DESCRIPTION: Places a black circle of radius 44 at center (461, 145).
; PLAN: r0=461(x), r1=145(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 145
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
