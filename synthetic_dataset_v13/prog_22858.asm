; DESCRIPTION: Renders a magenta disk with center (201, 80) and radius 75.
; PLAN: r0=201(x), r1=80(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 80
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
