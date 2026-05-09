; DESCRIPTION: Renders a white disk with center (84, 130) and radius 74.
; PLAN: r0=84(x), r1=130(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 130
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
