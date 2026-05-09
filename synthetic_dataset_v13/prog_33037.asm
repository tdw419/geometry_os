; DESCRIPTION: Places a black circle of radius 37 at center (79, 137).
; PLAN: r0=79(x), r1=137(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 137
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
