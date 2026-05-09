; DESCRIPTION: Renders a blue disk with center (436, 101) and radius 71.
; PLAN: r0=436(x), r1=101(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 101
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
