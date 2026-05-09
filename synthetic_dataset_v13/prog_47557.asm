; DESCRIPTION: Places a red circle of radius 17 at center (189, 67).
; PLAN: r0=189(x), r1=67(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 67
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
