; DESCRIPTION: Creates a magenta circular shape at (343, 154) with radius 34.
; PLAN: r0=343(x), r1=154(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 154
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
