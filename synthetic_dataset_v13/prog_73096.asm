; DESCRIPTION: Creates a magenta circular shape at (172, 83) with radius 79.
; PLAN: r0=172(x), r1=83(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 83
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
