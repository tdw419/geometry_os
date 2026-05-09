; DESCRIPTION: Creates a red circular shape at (218, 141) with radius 75.
; PLAN: r0=218(x), r1=141(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 141
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
