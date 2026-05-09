; DESCRIPTION: Creates a magenta circular shape at (287, 122) with radius 79.
; PLAN: r0=287(x), r1=122(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 122
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
