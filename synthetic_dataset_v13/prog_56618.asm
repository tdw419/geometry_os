; DESCRIPTION: Places a blue circle of radius 51 at center (286, 136).
; PLAN: r0=286(x), r1=136(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 136
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
