; DESCRIPTION: Creates a red circular shape at (77, 86) with radius 39.
; PLAN: r0=77(x), r1=86(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 86
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
