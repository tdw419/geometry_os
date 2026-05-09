; DESCRIPTION: Creates a red circular shape at (400, 115) with radius 56.
; PLAN: r0=400(x), r1=115(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 115
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
