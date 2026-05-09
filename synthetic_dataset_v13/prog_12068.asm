; DESCRIPTION: Renders a magenta disk with center (141, 178) and radius 66.
; PLAN: r0=141(x), r1=178(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 178
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
