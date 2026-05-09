; DESCRIPTION: Creates a magenta circular shape at (496, 88) with radius 15.
; PLAN: r0=496(x), r1=88(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 496
LDI r1, 88
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
