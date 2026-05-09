; DESCRIPTION: Places a purple circle of radius 71 at center (247, 131).
; PLAN: r0=247(x), r1=131(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 131
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
