; DESCRIPTION: Places a purple circle of radius 45 at center (346, 51).
; PLAN: r0=346(x), r1=51(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 51
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
