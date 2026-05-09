; DESCRIPTION: Creates a magenta circular shape at (252, 135) with radius 58.
; PLAN: r0=252(x), r1=135(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 135
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
