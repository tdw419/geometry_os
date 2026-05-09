; DESCRIPTION: Renders a yellow disk with center (224, 217) and radius 31.
; PLAN: r0=224(x), r1=217(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 217
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
