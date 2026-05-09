; DESCRIPTION: Places a purple circle of radius 10 at center (355, 120).
; PLAN: r0=355(x), r1=120(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 120
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
