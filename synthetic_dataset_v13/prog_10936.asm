; DESCRIPTION: Places a black circle of radius 11 at center (191, 116).
; PLAN: r0=191(x), r1=116(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 116
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
