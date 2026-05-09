; DESCRIPTION: Places a black circle of radius 24 at center (141, 195).
; PLAN: r0=141(x), r1=195(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 195
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
