; DESCRIPTION: Places a purple circle of radius 51 at center (130, 173).
; PLAN: r0=130(x), r1=173(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 173
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
