; DESCRIPTION: Places a black circle of radius 49 at center (143, 100).
; PLAN: r0=143(x), r1=100(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 100
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
