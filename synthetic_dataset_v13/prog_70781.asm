; DESCRIPTION: Places a purple circle of radius 53 at center (217, 158).
; PLAN: r0=217(x), r1=158(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 158
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
