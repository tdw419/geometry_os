; DESCRIPTION: Renders a magenta disk with center (336, 112) and radius 55.
; PLAN: r0=336(x), r1=112(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 112
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
