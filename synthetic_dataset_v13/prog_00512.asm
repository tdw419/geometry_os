; DESCRIPTION: Places a black circle of radius 57 at center (142, 102).
; PLAN: r0=142(x), r1=102(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 102
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
