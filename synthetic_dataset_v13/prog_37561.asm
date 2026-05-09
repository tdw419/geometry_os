; DESCRIPTION: Places a black circle of radius 46 at center (459, 51).
; PLAN: r0=459(x), r1=51(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 51
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
