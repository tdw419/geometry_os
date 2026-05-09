; DESCRIPTION: Renders a green disk with center (241, 191) and radius 47.
; PLAN: r0=241(x), r1=191(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 191
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
