; DESCRIPTION: Renders a blue disk with center (178, 130) and radius 13.
; PLAN: r0=178(x), r1=130(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 130
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
