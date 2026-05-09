; DESCRIPTION: Places a black circle of radius 71 at center (155, 145).
; PLAN: r0=155(x), r1=145(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 145
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
