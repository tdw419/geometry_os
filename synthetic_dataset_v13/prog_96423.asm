; DESCRIPTION: Places a red circle of radius 47 at center (418, 102).
; PLAN: r0=418(x), r1=102(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 102
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
