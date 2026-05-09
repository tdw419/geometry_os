; DESCRIPTION: Creates a magenta circular shape at (469, 61) with radius 43.
; PLAN: r0=469(x), r1=61(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 61
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
