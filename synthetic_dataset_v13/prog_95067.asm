; DESCRIPTION: Renders a blue disk with center (129, 130) and radius 56.
; PLAN: r0=129(x), r1=130(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 130
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
