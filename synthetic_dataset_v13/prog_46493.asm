; DESCRIPTION: Creates a magenta circular shape at (498, 240) with radius 10.
; PLAN: r0=498(x), r1=240(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 498
LDI r1, 240
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
