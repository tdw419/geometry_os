; DESCRIPTION: Places a magenta circle of radius 50 at center (51, 115).
; PLAN: r0=51(x), r1=115(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 115
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
