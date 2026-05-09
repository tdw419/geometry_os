; DESCRIPTION: Places a black circle of radius 44 at center (129, 71).
; PLAN: r0=129(x), r1=71(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 71
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
