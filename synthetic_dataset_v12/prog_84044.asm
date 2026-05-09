; DESCRIPTION: Places a red circle of radius 53 at center (436, 114).
; PLAN: r0=436(x), r1=114(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 114
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
