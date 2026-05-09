; DESCRIPTION: Places a purple circle of radius 12 at center (51, 243).
; PLAN: r0=51(x), r1=243(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 243
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
