; DESCRIPTION: Creates a magenta circular shape at (83, 72) with radius 46.
; PLAN: r0=83(x), r1=72(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 72
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
