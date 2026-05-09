; DESCRIPTION: Places a black circle of radius 18 at center (389, 79).
; PLAN: r0=389(x), r1=79(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 79
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
