; DESCRIPTION: Places a purple circle of radius 35 at center (204, 171).
; PLAN: r0=204(x), r1=171(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 171
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
