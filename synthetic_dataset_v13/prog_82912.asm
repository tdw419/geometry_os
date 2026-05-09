; DESCRIPTION: Renders a blue disk with center (441, 196) and radius 26.
; PLAN: r0=441(x), r1=196(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 196
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
