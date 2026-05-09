; DESCRIPTION: Creates a magenta circular shape at (233, 156) with radius 26.
; PLAN: r0=233(x), r1=156(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 156
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
