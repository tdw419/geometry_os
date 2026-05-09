; DESCRIPTION: Renders a blue disk with center (447, 224) and radius 23.
; PLAN: r0=447(x), r1=224(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 224
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
