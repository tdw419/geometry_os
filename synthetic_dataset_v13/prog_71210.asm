; DESCRIPTION: Renders a magenta disk with center (418, 78) and radius 77.
; PLAN: r0=418(x), r1=78(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 78
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
