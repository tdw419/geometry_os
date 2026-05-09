; DESCRIPTION: Creates a magenta circular shape at (109, 53) with radius 22.
; PLAN: r0=109(x), r1=53(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 53
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
