; DESCRIPTION: Places a purple circle of radius 18 at center (397, 70).
; PLAN: r0=397(x), r1=70(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 70
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
