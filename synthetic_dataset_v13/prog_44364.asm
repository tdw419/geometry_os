; DESCRIPTION: Renders a green disk with center (373, 50) and radius 30.
; PLAN: r0=373(x), r1=50(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 50
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
