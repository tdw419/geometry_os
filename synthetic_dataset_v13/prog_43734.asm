; DESCRIPTION: Places a magenta circle of radius 51 at center (134, 192).
; PLAN: r0=134(x), r1=192(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 192
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
