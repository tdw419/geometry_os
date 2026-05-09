; DESCRIPTION: Places a blue circle of radius 51 at center (361, 93).
; PLAN: r0=361(x), r1=93(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 93
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
