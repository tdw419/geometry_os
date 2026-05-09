; DESCRIPTION: Places a red circle of radius 69 at center (201, 77).
; PLAN: r0=201(x), r1=77(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 77
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
