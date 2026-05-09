; DESCRIPTION: Places a purple circle of radius 20 at center (56, 120).
; PLAN: r0=56(x), r1=120(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 120
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
