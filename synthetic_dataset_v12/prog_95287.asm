; DESCRIPTION: Creates a magenta circular shape at (250, 161) with radius 49.
; PLAN: r0=250(x), r1=161(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 161
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
