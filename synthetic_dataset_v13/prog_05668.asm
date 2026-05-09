; DESCRIPTION: Creates a magenta circular shape at (325, 85) with radius 80.
; PLAN: r0=325(x), r1=85(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 85
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
