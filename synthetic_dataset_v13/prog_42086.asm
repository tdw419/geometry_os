; DESCRIPTION: Creates a magenta circular shape at (164, 163) with radius 58.
; PLAN: r0=164(x), r1=163(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 163
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
