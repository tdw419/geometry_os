; DESCRIPTION: Places a purple circle of radius 62 at center (424, 129).
; PLAN: r0=424(x), r1=129(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 129
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
