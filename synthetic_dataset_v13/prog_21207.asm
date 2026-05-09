; DESCRIPTION: Creates a magenta circular shape at (124, 167) with radius 55.
; PLAN: r0=124(x), r1=167(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 167
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
