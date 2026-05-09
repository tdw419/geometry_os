; DESCRIPTION: Renders a magenta disk with center (399, 78) and radius 35.
; PLAN: r0=399(x), r1=78(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 78
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
