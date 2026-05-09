; DESCRIPTION: Places a magenta circle of radius 51 at center (233, 94).
; PLAN: r0=233(x), r1=94(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 94
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
