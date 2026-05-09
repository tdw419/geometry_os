; DESCRIPTION: Places a black circle of radius 26 at center (407, 193).
; PLAN: r0=407(x), r1=193(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 193
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
