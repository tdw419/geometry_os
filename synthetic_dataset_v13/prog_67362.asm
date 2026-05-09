; DESCRIPTION: Creates a magenta circular shape at (164, 189) with radius 10.
; PLAN: r0=164(x), r1=189(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 189
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
