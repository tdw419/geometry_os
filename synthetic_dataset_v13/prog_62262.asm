; DESCRIPTION: Renders a black disk with center (407, 191) and radius 30.
; PLAN: r0=407(x), r1=191(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 191
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
