; DESCRIPTION: Places a purple circle of radius 14 at center (192, 120).
; PLAN: r0=192(x), r1=120(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 120
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
