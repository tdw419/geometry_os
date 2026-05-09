; DESCRIPTION: Places a white circle of radius 39 at center (311, 131).
; PLAN: r0=311(x), r1=131(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 131
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
