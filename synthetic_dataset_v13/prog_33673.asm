; DESCRIPTION: Places a black circle of radius 12 at center (19, 102).
; PLAN: r0=19(x), r1=102(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 102
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
