; DESCRIPTION: Renders a magenta disk with center (177, 155) and radius 53.
; PLAN: r0=177(x), r1=155(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 155
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
