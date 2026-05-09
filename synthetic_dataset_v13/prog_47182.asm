; DESCRIPTION: Places a red circle of radius 75 at center (339, 93).
; PLAN: r0=339(x), r1=93(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 93
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
