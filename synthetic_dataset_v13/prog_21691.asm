; DESCRIPTION: Creates a white circular shape at (377, 93) with radius 44.
; PLAN: r0=377(x), r1=93(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 93
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
