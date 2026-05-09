; DESCRIPTION: Places a purple circle of radius 54 at center (226, 94).
; PLAN: r0=226(x), r1=94(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 94
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
