; DESCRIPTION: Creates a magenta circular shape at (246, 145) with radius 55.
; PLAN: r0=246(x), r1=145(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 145
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
