; DESCRIPTION: Creates a magenta circular shape at (254, 53) with radius 39.
; PLAN: r0=254(x), r1=53(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 53
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
