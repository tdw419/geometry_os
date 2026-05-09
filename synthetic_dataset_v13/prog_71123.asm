; DESCRIPTION: Places a black circle of radius 75 at center (194, 133).
; PLAN: r0=194(x), r1=133(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 133
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
