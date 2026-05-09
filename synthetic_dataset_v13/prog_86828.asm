; DESCRIPTION: Places a purple circle of radius 32 at center (83, 148).
; PLAN: r0=83(x), r1=148(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 148
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
