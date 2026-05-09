; DESCRIPTION: Renders a magenta disk with center (98, 104) and radius 51.
; PLAN: r0=98(x), r1=104(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 104
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
