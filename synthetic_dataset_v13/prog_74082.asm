; DESCRIPTION: Places a purple circle of radius 49 at center (329, 172).
; PLAN: r0=329(x), r1=172(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 172
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
