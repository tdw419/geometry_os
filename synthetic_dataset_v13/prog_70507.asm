; DESCRIPTION: Creates a magenta circular shape at (123, 153) with radius 37.
; PLAN: r0=123(x), r1=153(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 153
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
