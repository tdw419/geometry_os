; DESCRIPTION: Creates a magenta circular shape at (109, 154) with radius 73.
; PLAN: r0=109(x), r1=154(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 154
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
