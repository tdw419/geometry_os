; DESCRIPTION: Renders a green disk with center (195, 87) and radius 71.
; PLAN: r0=195(x), r1=87(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 87
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
