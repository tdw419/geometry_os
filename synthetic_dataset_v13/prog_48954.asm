; DESCRIPTION: Creates a magenta circular shape at (88, 184) with radius 47.
; PLAN: r0=88(x), r1=184(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 184
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
