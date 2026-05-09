; DESCRIPTION: Creates a magenta circular shape at (269, 123) with radius 51.
; PLAN: r0=269(x), r1=123(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 123
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
