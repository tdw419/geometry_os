; DESCRIPTION: Creates a magenta circular shape at (343, 195) with radius 51.
; PLAN: r0=343(x), r1=195(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 195
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
