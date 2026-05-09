; DESCRIPTION: Renders a black disk with center (224, 97) and radius 17.
; PLAN: r0=224(x), r1=97(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 97
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
