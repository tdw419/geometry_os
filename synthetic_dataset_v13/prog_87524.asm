; DESCRIPTION: Places a purple circle of radius 48 at center (412, 205).
; PLAN: r0=412(x), r1=205(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 205
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
