; DESCRIPTION: Places a purple circle of radius 10 at center (128, 53).
; PLAN: r0=128(x), r1=53(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 53
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
