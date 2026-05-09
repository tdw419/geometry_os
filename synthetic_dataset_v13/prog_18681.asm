; DESCRIPTION: Places a red circle of radius 30 at center (418, 115).
; PLAN: r0=418(x), r1=115(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 115
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
