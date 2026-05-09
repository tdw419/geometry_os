; DESCRIPTION: Places a black circle of radius 25 at center (477, 130).
; PLAN: r0=477(x), r1=130(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 130
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
