; DESCRIPTION: Renders a magenta disk with center (342, 51) and radius 20.
; PLAN: r0=342(x), r1=51(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 51
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
