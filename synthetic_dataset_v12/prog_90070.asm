; DESCRIPTION: Places a purple circle of radius 61 at center (223, 148).
; PLAN: r0=223(x), r1=148(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 148
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
