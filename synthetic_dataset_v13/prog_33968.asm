; DESCRIPTION: Renders a yellow disk with center (129, 224) and radius 20.
; PLAN: r0=129(x), r1=224(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 224
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
