; DESCRIPTION: Creates a magenta circular shape at (141, 126) with radius 56.
; PLAN: r0=141(x), r1=126(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 126
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
