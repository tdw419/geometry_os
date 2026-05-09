; DESCRIPTION: Renders a magenta disk with center (454, 78) and radius 19.
; PLAN: r0=454(x), r1=78(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 78
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
