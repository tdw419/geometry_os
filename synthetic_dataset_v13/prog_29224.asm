; DESCRIPTION: Renders a black disk with center (393, 170) and radius 22.
; PLAN: r0=393(x), r1=170(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 170
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
