; DESCRIPTION: Creates a magenta circular shape at (245, 61) with radius 57.
; PLAN: r0=245(x), r1=61(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 61
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
