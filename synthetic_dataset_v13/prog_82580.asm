; DESCRIPTION: Places a purple circle of radius 51 at center (174, 92).
; PLAN: r0=174(x), r1=92(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 92
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
