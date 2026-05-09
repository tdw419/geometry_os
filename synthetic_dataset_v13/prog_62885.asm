; DESCRIPTION: Places a red circle of radius 47 at center (117, 100).
; PLAN: r0=117(x), r1=100(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 100
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
