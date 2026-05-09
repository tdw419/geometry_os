; DESCRIPTION: Creates a magenta circular shape at (285, 67) with radius 34.
; PLAN: r0=285(x), r1=67(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 67
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
