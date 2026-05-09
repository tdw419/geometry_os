; DESCRIPTION: Creates a red circular shape at (56, 218) with radius 36.
; PLAN: r0=56(x), r1=218(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 218
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
