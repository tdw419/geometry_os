; DESCRIPTION: Places a black circle of radius 62 at center (195, 100).
; PLAN: r0=195(x), r1=100(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 100
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
