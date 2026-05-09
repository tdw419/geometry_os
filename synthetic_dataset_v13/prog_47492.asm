; DESCRIPTION: Creates a magenta circular shape at (287, 81) with radius 69.
; PLAN: r0=287(x), r1=81(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 81
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
