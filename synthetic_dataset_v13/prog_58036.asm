; DESCRIPTION: Renders a blue disk with center (325, 20) and radius 14.
; PLAN: r0=325(x), r1=20(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 20
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
