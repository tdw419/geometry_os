; DESCRIPTION: Renders a magenta disk with center (351, 123) and radius 24.
; PLAN: r0=351(x), r1=123(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 123
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
