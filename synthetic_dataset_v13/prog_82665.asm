; DESCRIPTION: Places a red circle of radius 34 at center (100, 217).
; PLAN: r0=100(x), r1=217(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 217
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
