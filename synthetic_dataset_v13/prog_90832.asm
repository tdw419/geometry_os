; DESCRIPTION: Creates a magenta circular shape at (312, 118) with radius 55.
; PLAN: r0=312(x), r1=118(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 118
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
