; DESCRIPTION: Renders a magenta disk with center (454, 49) and radius 10.
; PLAN: r0=454(x), r1=49(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 49
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
