; DESCRIPTION: Places a red circle of radius 24 at center (266, 87).
; PLAN: r0=266(x), r1=87(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 87
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
