; DESCRIPTION: Renders a magenta disk with center (342, 201) and radius 15.
; PLAN: r0=342(x), r1=201(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 201
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
