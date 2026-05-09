; DESCRIPTION: Renders a magenta disk with center (227, 120) and radius 49.
; PLAN: r0=227(x), r1=120(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 120
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
