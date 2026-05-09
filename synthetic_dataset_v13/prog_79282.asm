; DESCRIPTION: Renders a blue disk with center (219, 183) and radius 17.
; PLAN: r0=219(x), r1=183(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 183
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
