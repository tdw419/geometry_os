; DESCRIPTION: Places a red circle of radius 10 at center (124, 131).
; PLAN: r0=124(x), r1=131(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 131
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
