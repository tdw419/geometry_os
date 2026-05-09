; DESCRIPTION: Creates a magenta circular shape at (336, 72) with radius 68.
; PLAN: r0=336(x), r1=72(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 72
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
