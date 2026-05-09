; DESCRIPTION: Renders a black disk with center (209, 170) and radius 79.
; PLAN: r0=209(x), r1=170(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 170
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
