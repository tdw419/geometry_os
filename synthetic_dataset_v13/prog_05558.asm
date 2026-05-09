; DESCRIPTION: Places a purple circle of radius 70 at center (234, 179).
; PLAN: r0=234(x), r1=179(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 179
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
