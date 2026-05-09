; DESCRIPTION: Renders a magenta disk with center (109, 179) and radius 55.
; PLAN: r0=109(x), r1=179(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 179
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
