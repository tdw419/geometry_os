; DESCRIPTION: Places a black circle of radius 12 at center (422, 238).
; PLAN: r0=422(x), r1=238(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 238
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
