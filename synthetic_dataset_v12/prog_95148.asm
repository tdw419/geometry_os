; DESCRIPTION: Creates a red circular shape at (257, 14) with radius 12.
; PLAN: r0=257(x), r1=14(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 14
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
