; DESCRIPTION: Places a black circle of radius 18 at center (87, 61).
; PLAN: r0=87(x), r1=61(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 61
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
