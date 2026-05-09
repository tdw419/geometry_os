; DESCRIPTION: Renders a green disk with center (289, 170) and radius 79.
; PLAN: r0=289(x), r1=170(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 170
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
