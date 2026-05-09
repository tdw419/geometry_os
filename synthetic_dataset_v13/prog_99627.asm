; DESCRIPTION: Places a red circle of radius 36 at center (201, 185).
; PLAN: r0=201(x), r1=185(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 185
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
