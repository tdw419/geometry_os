; DESCRIPTION: Creates a magenta circular shape at (311, 191) with radius 64.
; PLAN: r0=311(x), r1=191(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 191
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
