; DESCRIPTION: Renders a magenta disk with center (274, 153) and radius 73.
; PLAN: r0=274(x), r1=153(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 153
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
