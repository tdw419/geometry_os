; DESCRIPTION: Creates a white circular shape at (124, 93) with radius 39.
; PLAN: r0=124(x), r1=93(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 93
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
