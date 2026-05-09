; DESCRIPTION: Places a black circle of radius 44 at center (368, 122).
; PLAN: r0=368(x), r1=122(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 122
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
