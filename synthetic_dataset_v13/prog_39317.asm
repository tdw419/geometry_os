; DESCRIPTION: Creates a magenta circular shape at (399, 79) with radius 75.
; PLAN: r0=399(x), r1=79(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 79
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
