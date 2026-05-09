; DESCRIPTION: Creates a magenta circular shape at (355, 214) with radius 30.
; PLAN: r0=355(x), r1=214(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 214
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
