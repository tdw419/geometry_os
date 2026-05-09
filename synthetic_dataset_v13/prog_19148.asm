; DESCRIPTION: Creates a magenta circular shape at (356, 140) with radius 78.
; PLAN: r0=356(x), r1=140(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 140
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
