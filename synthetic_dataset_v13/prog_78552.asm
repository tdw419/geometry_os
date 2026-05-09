; DESCRIPTION: Creates a red circular shape at (195, 179) with radius 18.
; PLAN: r0=195(x), r1=179(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 179
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
