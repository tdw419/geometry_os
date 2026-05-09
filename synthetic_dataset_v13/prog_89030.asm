; DESCRIPTION: Renders a magenta disk with center (141, 155) and radius 55.
; PLAN: r0=141(x), r1=155(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 155
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
