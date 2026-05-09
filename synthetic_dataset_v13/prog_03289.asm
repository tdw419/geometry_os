; DESCRIPTION: Places a black circle of radius 64 at center (142, 176).
; PLAN: r0=142(x), r1=176(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 176
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
