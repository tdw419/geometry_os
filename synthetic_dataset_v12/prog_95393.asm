; DESCRIPTION: Creates a magenta circular shape at (417, 77) with radius 64.
; PLAN: r0=417(x), r1=77(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 77
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
