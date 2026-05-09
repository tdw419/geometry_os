; DESCRIPTION: Creates a magenta circular shape at (453, 118) with radius 26.
; PLAN: r0=453(x), r1=118(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 118
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
