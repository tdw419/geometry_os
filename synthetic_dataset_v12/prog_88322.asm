; DESCRIPTION: Creates a magenta circular shape at (293, 12) with radius 10.
; PLAN: r0=293(x), r1=12(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 12
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
