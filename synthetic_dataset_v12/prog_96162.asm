; DESCRIPTION: Renders a blue disk with center (325, 129) and radius 45.
; PLAN: r0=325(x), r1=129(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 129
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
