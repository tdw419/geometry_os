; DESCRIPTION: Places a red circle of radius 11 at center (363, 32).
; PLAN: r0=363(x), r1=32(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 32
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
