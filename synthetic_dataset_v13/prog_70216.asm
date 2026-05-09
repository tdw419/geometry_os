; DESCRIPTION: Renders a black disk with center (363, 62) and radius 16.
; PLAN: r0=363(x), r1=62(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 62
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
