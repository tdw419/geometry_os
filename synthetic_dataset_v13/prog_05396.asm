; DESCRIPTION: Creates a magenta circular shape at (389, 177) with radius 25.
; PLAN: r0=389(x), r1=177(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 177
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
