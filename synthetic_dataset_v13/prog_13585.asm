; DESCRIPTION: Renders a blue disk with center (224, 208) and radius 36.
; PLAN: r0=224(x), r1=208(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 208
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
