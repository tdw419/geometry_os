; DESCRIPTION: Renders a blue disk with center (433, 170) and radius 73.
; PLAN: r0=433(x), r1=170(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 170
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
