; DESCRIPTION: Creates a magenta circular shape at (71, 53) with radius 30.
; PLAN: r0=71(x), r1=53(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 53
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
