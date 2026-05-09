; DESCRIPTION: Creates a magenta circular shape at (341, 67) with radius 33.
; PLAN: r0=341(x), r1=67(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 67
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
