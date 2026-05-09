; DESCRIPTION: Creates a red circular shape at (233, 115) with radius 78.
; PLAN: r0=233(x), r1=115(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 115
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
