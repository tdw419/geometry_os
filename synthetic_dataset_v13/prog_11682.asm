; DESCRIPTION: Places a magenta circle of radius 51 at center (297, 99).
; PLAN: r0=297(x), r1=99(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 99
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
