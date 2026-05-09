; DESCRIPTION: Places a black circle of radius 49 at center (83, 162).
; PLAN: r0=83(x), r1=162(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 162
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
