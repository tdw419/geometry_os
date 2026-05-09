; DESCRIPTION: Creates a magenta circular shape at (471, 13) with radius 11.
; PLAN: r0=471(x), r1=13(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 13
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
