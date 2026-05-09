; DESCRIPTION: Renders a green disk with center (351, 191) and radius 53.
; PLAN: r0=351(x), r1=191(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 191
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
