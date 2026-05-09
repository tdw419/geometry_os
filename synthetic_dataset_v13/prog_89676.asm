; DESCRIPTION: Creates a magenta circular shape at (76, 103) with radius 34.
; PLAN: r0=76(x), r1=103(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 103
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
