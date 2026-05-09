; DESCRIPTION: Creates a red circular shape at (417, 165) with radius 52.
; PLAN: r0=417(x), r1=165(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 165
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
