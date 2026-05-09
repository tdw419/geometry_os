; DESCRIPTION: Creates a magenta circular shape at (393, 148) with radius 75.
; PLAN: r0=393(x), r1=148(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 148
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
