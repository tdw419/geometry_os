; DESCRIPTION: Creates a red circular shape at (312, 171) with radius 72.
; PLAN: r0=312(x), r1=171(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 171
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
