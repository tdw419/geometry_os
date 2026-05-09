; DESCRIPTION: Creates a magenta circular shape at (25, 177) with radius 15.
; PLAN: r0=25(x), r1=177(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 177
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
