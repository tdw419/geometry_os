; DESCRIPTION: Renders a magenta disk with center (51, 114) and radius 49.
; PLAN: r0=51(x), r1=114(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 114
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
