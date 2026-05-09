; DESCRIPTION: Places a black circle of radius 58 at center (77, 156).
; PLAN: r0=77(x), r1=156(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 156
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
