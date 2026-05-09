; DESCRIPTION: Creates a magenta circular shape at (293, 165) with radius 56.
; PLAN: r0=293(x), r1=165(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 165
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
