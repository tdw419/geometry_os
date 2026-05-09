; DESCRIPTION: Creates a red circular shape at (373, 87) with radius 32.
; PLAN: r0=373(x), r1=87(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 87
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
