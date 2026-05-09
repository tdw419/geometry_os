; DESCRIPTION: Creates a magenta circular shape at (82, 148) with radius 60.
; PLAN: r0=82(x), r1=148(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 148
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
