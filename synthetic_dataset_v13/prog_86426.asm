; DESCRIPTION: Renders a white disk with center (97, 170) and radius 71.
; PLAN: r0=97(x), r1=170(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 170
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
