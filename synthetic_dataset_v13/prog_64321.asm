; DESCRIPTION: Creates a red circular shape at (145, 77) with radius 75.
; PLAN: r0=145(x), r1=77(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 77
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
