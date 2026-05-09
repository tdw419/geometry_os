; DESCRIPTION: Places a blue circle of radius 51 at center (345, 122).
; PLAN: r0=345(x), r1=122(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 122
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
