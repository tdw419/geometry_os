; DESCRIPTION: Creates a magenta circular shape at (356, 88) with radius 44.
; PLAN: r0=356(x), r1=88(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 88
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
