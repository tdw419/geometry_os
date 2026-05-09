; DESCRIPTION: Creates a magenta circular shape at (244, 193) with radius 47.
; PLAN: r0=244(x), r1=193(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 193
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
