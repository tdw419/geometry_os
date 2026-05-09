; DESCRIPTION: Places a black circle of radius 73 at center (291, 116).
; PLAN: r0=291(x), r1=116(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 116
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
