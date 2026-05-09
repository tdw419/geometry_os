; DESCRIPTION: Creates a magenta circular shape at (142, 71) with radius 19.
; PLAN: r0=142(x), r1=71(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 71
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
