; DESCRIPTION: Renders a white disk with center (153, 224) and radius 17.
; PLAN: r0=153(x), r1=224(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 224
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
