; DESCRIPTION: Creates a red circular shape at (229, 77) with radius 64.
; PLAN: r0=229(x), r1=77(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 77
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
