; DESCRIPTION: Renders a blue disk with center (224, 158) and radius 35.
; PLAN: r0=224(x), r1=158(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 158
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
