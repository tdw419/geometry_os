; DESCRIPTION: Places a black circle of radius 55 at center (137, 72).
; PLAN: r0=137(x), r1=72(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 72
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
