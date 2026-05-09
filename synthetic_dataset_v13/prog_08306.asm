; DESCRIPTION: Places a black circle of radius 13 at center (498, 31).
; PLAN: r0=498(x), r1=31(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 498
LDI r1, 31
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
