; DESCRIPTION: Places a red circle of radius 53 at center (389, 129).
; PLAN: r0=389(x), r1=129(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 129
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
