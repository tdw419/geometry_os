; DESCRIPTION: Places a purple circle of radius 32 at center (85, 94).
; PLAN: r0=85(x), r1=94(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 94
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
