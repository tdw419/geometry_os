; DESCRIPTION: Creates a magenta circular shape at (381, 89) with radius 32.
; PLAN: r0=381(x), r1=89(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 89
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
