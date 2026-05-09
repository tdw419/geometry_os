; DESCRIPTION: Creates a black circular shape at (335, 188) with radius 32.
; PLAN: r0=335(x), r1=188(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 188
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
