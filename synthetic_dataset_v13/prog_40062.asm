; DESCRIPTION: Creates a magenta circular shape at (129, 119) with radius 64.
; PLAN: r0=129(x), r1=119(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 119
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
