; DESCRIPTION: Places a purple circle of radius 48 at center (63, 116).
; PLAN: r0=63(x), r1=116(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 116
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
