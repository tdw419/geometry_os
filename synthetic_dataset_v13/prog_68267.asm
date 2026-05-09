; DESCRIPTION: Creates a magenta circular shape at (409, 93) with radius 69.
; PLAN: r0=409(x), r1=93(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 93
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
