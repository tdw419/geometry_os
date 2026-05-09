; DESCRIPTION: Places a black circle of radius 37 at center (40, 157).
; PLAN: r0=40(x), r1=157(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 157
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
