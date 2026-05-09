; DESCRIPTION: Creates a magenta circular shape at (123, 75) with radius 58.
; PLAN: r0=123(x), r1=75(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 75
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
