; DESCRIPTION: Places a black circle of radius 24 at center (259, 133).
; PLAN: r0=259(x), r1=133(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 133
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
