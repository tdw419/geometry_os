; DESCRIPTION: Creates a magenta circular shape at (234, 103) with radius 30.
; PLAN: r0=234(x), r1=103(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 103
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
