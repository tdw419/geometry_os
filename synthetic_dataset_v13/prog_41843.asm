; DESCRIPTION: Places a purple circle of radius 62 at center (414, 85).
; PLAN: r0=414(x), r1=85(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 85
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
