; DESCRIPTION: Places a black circle of radius 64 at center (339, 114).
; PLAN: r0=339(x), r1=114(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 114
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
