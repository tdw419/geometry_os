; DESCRIPTION: Creates a magenta circular shape at (75, 111) with radius 45.
; PLAN: r0=75(x), r1=111(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 111
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
