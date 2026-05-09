; DESCRIPTION: Creates a magenta circular shape at (129, 71) with radius 52.
; PLAN: r0=129(x), r1=71(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 71
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
