; DESCRIPTION: Places a purple circle of radius 61 at center (376, 82).
; PLAN: r0=376(x), r1=82(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 82
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
