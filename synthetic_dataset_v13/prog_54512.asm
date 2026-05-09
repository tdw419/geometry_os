; DESCRIPTION: Creates a magenta circular shape at (129, 101) with radius 53.
; PLAN: r0=129(x), r1=101(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 101
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
