; DESCRIPTION: Places a blue circle of radius 72 at center (417, 85).
; PLAN: r0=417(x), r1=85(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 85
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
