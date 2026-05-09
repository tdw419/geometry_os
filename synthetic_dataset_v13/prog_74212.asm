; DESCRIPTION: Renders a magenta disk with center (140, 98) and radius 73.
; PLAN: r0=140(x), r1=98(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 98
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
