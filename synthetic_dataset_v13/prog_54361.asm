; DESCRIPTION: Creates a magenta circular shape at (401, 115) with radius 69.
; PLAN: r0=401(x), r1=115(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 115
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
