; DESCRIPTION: Places a purple circle of radius 30 at center (422, 72).
; PLAN: r0=422(x), r1=72(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 72
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
