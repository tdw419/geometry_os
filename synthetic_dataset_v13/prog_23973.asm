; DESCRIPTION: Places a purple circle of radius 63 at center (312, 191).
; PLAN: r0=312(x), r1=191(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 191
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
