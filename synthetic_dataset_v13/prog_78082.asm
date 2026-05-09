; DESCRIPTION: Renders a magenta disk with center (100, 114) and radius 20.
; PLAN: r0=100(x), r1=114(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 114
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
