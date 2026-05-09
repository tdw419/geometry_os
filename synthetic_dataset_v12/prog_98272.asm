; DESCRIPTION: Creates a magenta circular shape at (399, 127) with radius 45.
; PLAN: r0=399(x), r1=127(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 127
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
