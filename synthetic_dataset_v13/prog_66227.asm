; DESCRIPTION: Renders a green disk with center (224, 233) and radius 19.
; PLAN: r0=224(x), r1=233(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 233
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
