; DESCRIPTION: Places a blue circle of radius 51 at center (112, 71).
; PLAN: r0=112(x), r1=71(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 71
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
