; DESCRIPTION: Places a purple circle of radius 64 at center (81, 185).
; PLAN: r0=81(x), r1=185(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 185
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
