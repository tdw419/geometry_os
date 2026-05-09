; DESCRIPTION: Renders a blue disk with center (414, 225) and radius 28.
; PLAN: r0=414(x), r1=225(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 225
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
