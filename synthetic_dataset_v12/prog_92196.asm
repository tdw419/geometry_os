; DESCRIPTION: Places a red circle of radius 31 at center (373, 71).
; PLAN: r0=373(x), r1=71(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 71
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
