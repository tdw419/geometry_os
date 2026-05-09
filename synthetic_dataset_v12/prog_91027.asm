; DESCRIPTION: Creates a red circular shape at (321, 68) with radius 52.
; PLAN: r0=321(x), r1=68(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 68
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
