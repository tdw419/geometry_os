; DESCRIPTION: Creates a red circular shape at (407, 74) with radius 55.
; PLAN: r0=407(x), r1=74(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 74
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
