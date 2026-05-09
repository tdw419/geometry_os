; DESCRIPTION: Creates a magenta circular shape at (244, 29) with radius 23.
; PLAN: r0=244(x), r1=29(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 29
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
