; DESCRIPTION: Creates a magenta circular shape at (285, 161) with radius 15.
; PLAN: r0=285(x), r1=161(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 161
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
