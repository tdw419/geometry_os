; DESCRIPTION: Creates a magenta circular shape at (258, 116) with radius 38.
; PLAN: r0=258(x), r1=116(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 116
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
