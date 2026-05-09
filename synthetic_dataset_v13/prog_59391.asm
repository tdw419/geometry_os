; DESCRIPTION: Creates a magenta circular shape at (109, 137) with radius 54.
; PLAN: r0=109(x), r1=137(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 137
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
