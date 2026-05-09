; DESCRIPTION: Creates a magenta circular shape at (88, 24) with radius 24.
; PLAN: r0=88(x), r1=24(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 24
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
