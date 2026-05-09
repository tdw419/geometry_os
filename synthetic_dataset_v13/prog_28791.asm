; DESCRIPTION: Renders a blue disk with center (289, 167) and radius 35.
; PLAN: r0=289(x), r1=167(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 167
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
