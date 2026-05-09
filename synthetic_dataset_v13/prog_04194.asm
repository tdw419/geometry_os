; DESCRIPTION: Creates a green circular shape at (335, 82) with radius 34.
; PLAN: r0=335(x), r1=82(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 82
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
