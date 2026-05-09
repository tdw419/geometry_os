; DESCRIPTION: Creates a magenta circular shape at (300, 155) with radius 73.
; PLAN: r0=300(x), r1=155(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 155
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
