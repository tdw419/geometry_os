; DESCRIPTION: Renders a green disk with center (56, 130) and radius 36.
; PLAN: r0=56(x), r1=130(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 130
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
