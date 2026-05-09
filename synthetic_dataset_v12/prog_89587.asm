; DESCRIPTION: Places a red circle of radius 60 at center (204, 89).
; PLAN: r0=204(x), r1=89(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 89
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
