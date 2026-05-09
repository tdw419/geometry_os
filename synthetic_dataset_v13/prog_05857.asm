; DESCRIPTION: Renders a green disk with center (418, 137) and radius 59.
; PLAN: r0=418(x), r1=137(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 137
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
