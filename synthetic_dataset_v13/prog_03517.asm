; DESCRIPTION: Creates a red circular shape at (283, 131) with radius 47.
; PLAN: r0=283(x), r1=131(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 131
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
