; DESCRIPTION: Places a purple circle of radius 51 at center (134, 146).
; PLAN: r0=134(x), r1=146(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 146
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
