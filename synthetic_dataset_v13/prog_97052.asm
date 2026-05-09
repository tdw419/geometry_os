; DESCRIPTION: Places a purple circle of radius 56 at center (186, 106).
; PLAN: r0=186(x), r1=106(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 106
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
