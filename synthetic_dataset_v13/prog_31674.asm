; DESCRIPTION: Creates a magenta circular shape at (342, 123) with radius 64.
; PLAN: r0=342(x), r1=123(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 123
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
