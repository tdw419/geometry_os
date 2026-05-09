; DESCRIPTION: Places a purple circle of radius 73 at center (403, 153).
; PLAN: r0=403(x), r1=153(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 153
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
