; DESCRIPTION: Creates a red circular shape at (417, 73) with radius 64.
; PLAN: r0=417(x), r1=73(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 73
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
