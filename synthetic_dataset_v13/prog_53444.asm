; DESCRIPTION: Renders a black disk with center (166, 191) and radius 35.
; PLAN: r0=166(x), r1=191(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 191
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
