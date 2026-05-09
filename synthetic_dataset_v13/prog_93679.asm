; DESCRIPTION: Places a red circle of radius 28 at center (266, 57).
; PLAN: r0=266(x), r1=57(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 57
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
