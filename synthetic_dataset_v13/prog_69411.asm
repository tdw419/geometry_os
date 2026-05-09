; DESCRIPTION: Places a black circle of radius 62 at center (331, 99).
; PLAN: r0=331(x), r1=99(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 99
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
