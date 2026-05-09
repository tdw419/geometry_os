; DESCRIPTION: Places a red circle of radius 30 at center (53, 156).
; PLAN: r0=53(x), r1=156(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 156
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
