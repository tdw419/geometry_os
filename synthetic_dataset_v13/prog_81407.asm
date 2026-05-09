; DESCRIPTION: Creates a magenta circular shape at (471, 62) with radius 26.
; PLAN: r0=471(x), r1=62(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 62
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
