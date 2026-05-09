; DESCRIPTION: Places a red circle of radius 49 at center (200, 56).
; PLAN: r0=200(x), r1=56(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 56
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
