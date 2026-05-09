; DESCRIPTION: Renders a green disk with center (283, 191) and radius 59.
; PLAN: r0=283(x), r1=191(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 191
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
