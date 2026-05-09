; DESCRIPTION: Places a black circle of radius 63 at center (433, 105).
; PLAN: r0=433(x), r1=105(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 105
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
