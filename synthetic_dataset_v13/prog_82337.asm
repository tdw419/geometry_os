; DESCRIPTION: Creates a magenta circular shape at (249, 94) with radius 49.
; PLAN: r0=249(x), r1=94(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 94
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
