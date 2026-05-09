; DESCRIPTION: Creates a magenta circular shape at (127, 51) with radius 23.
; PLAN: r0=127(x), r1=51(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 51
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
