; DESCRIPTION: Places a yellow circle of radius 51 at center (134, 73).
; PLAN: r0=134(x), r1=73(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 73
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
