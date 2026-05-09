; DESCRIPTION: Renders a blue disk with center (441, 87) and radius 28.
; PLAN: r0=441(x), r1=87(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 87
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
