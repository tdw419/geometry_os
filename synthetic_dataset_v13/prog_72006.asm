; DESCRIPTION: Places a red circle of radius 57 at center (204, 70).
; PLAN: r0=204(x), r1=70(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 70
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
