; DESCRIPTION: Places a red circle of radius 67 at center (418, 77).
; PLAN: r0=418(x), r1=77(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 77
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
