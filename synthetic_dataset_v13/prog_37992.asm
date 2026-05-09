; DESCRIPTION: Creates a black circular shape at (368, 191) with radius 44.
; PLAN: r0=368(x), r1=191(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 191
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
