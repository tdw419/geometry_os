; DESCRIPTION: Creates a magenta circular shape at (163, 111) with radius 18.
; PLAN: r0=163(x), r1=111(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 111
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
