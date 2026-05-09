; DESCRIPTION: Creates a magenta circular shape at (346, 161) with radius 31.
; PLAN: r0=346(x), r1=161(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 161
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
