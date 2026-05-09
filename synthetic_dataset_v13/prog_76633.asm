; DESCRIPTION: Creates a magenta circular shape at (115, 183) with radius 55.
; PLAN: r0=115(x), r1=183(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 183
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
