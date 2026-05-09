; DESCRIPTION: Places a red circle of radius 45 at center (410, 53).
; PLAN: r0=410(x), r1=53(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 53
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
