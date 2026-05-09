; DESCRIPTION: Places a purple circle of radius 39 at center (71, 168).
; PLAN: r0=71(x), r1=168(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 168
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
