; DESCRIPTION: Creates a red circular shape at (389, 116) with radius 74.
; PLAN: r0=389(x), r1=116(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 116
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
