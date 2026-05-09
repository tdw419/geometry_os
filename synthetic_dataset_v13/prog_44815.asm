; DESCRIPTION: Renders a purple disk with center (242, 130) and radius 10.
; PLAN: r0=242(x), r1=130(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 130
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
