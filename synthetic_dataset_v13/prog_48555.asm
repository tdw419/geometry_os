; DESCRIPTION: Places a purple circle of radius 17 at center (457, 152).
; PLAN: r0=457(x), r1=152(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 152
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
