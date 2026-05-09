; DESCRIPTION: Creates a magenta circular shape at (80, 72) with radius 33.
; PLAN: r0=80(x), r1=72(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 72
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
