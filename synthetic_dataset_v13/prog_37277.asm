; DESCRIPTION: Creates a red circular shape at (83, 70) with radius 38.
; PLAN: r0=83(x), r1=70(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 70
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
