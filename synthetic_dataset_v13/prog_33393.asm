; DESCRIPTION: Creates a magenta circular shape at (382, 118) with radius 33.
; PLAN: r0=382(x), r1=118(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 118
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
