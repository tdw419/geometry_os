; DESCRIPTION: Creates a magenta circular shape at (422, 156) with radius 75.
; PLAN: r0=422(x), r1=156(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 156
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
