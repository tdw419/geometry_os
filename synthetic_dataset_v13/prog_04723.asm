; DESCRIPTION: Renders a blue disk with center (201, 57) and radius 55.
; PLAN: r0=201(x), r1=57(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 57
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
