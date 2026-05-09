; DESCRIPTION: Creates a magenta circular shape at (293, 104) with radius 72.
; PLAN: r0=293(x), r1=104(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 104
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
