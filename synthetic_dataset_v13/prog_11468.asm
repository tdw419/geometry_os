; DESCRIPTION: Creates a magenta circular shape at (241, 97) with radius 51.
; PLAN: r0=241(x), r1=97(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 97
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
