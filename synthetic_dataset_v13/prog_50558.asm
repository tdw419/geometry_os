; DESCRIPTION: Renders a green disk with center (378, 183) and radius 47.
; PLAN: r0=378(x), r1=183(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 183
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
