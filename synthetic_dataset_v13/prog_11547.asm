; DESCRIPTION: Creates a magenta circular shape at (336, 87) with radius 66.
; PLAN: r0=336(x), r1=87(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 87
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
