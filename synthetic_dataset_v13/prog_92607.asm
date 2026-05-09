; DESCRIPTION: Places a red circle of radius 43 at center (129, 73).
; PLAN: r0=129(x), r1=73(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 73
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
