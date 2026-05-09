; DESCRIPTION: Renders a green disk with center (233, 87) and radius 12.
; PLAN: r0=233(x), r1=87(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 87
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
