; DESCRIPTION: Creates a magenta circular shape at (381, 103) with radius 80.
; PLAN: r0=381(x), r1=103(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 103
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
