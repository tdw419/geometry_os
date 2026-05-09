; DESCRIPTION: Places a magenta circle of radius 51 at center (51, 155).
; PLAN: r0=51(x), r1=155(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 155
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
