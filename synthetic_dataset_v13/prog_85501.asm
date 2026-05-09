; DESCRIPTION: Creates a red circular shape at (89, 57) with radius 31.
; PLAN: r0=89(x), r1=57(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 57
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
