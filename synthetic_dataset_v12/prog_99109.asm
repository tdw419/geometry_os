; DESCRIPTION: Renders a magenta disk with center (378, 162) and radius 51.
; PLAN: r0=378(x), r1=162(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 162
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
