; DESCRIPTION: Places a purple circle of radius 39 at center (322, 214).
; PLAN: r0=322(x), r1=214(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 214
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
