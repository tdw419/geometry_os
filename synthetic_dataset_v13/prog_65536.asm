; DESCRIPTION: Creates a magenta circular shape at (389, 174) with radius 58.
; PLAN: r0=389(x), r1=174(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 174
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
