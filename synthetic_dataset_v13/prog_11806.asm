; DESCRIPTION: Renders a orange disk with center (224, 140) and radius 80.
; PLAN: r0=224(x), r1=140(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 140
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
