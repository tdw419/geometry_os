; DESCRIPTION: Creates a magenta circular shape at (241, 58) with radius 56.
; PLAN: r0=241(x), r1=58(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 58
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
