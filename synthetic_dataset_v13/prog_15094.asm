; DESCRIPTION: Renders a magenta disk with center (461, 137) and radius 28.
; PLAN: r0=461(x), r1=137(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 137
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
