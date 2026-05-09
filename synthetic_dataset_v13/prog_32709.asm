; DESCRIPTION: Renders a black disk with center (363, 87) and radius 59.
; PLAN: r0=363(x), r1=87(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 87
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
