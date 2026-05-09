; DESCRIPTION: Creates a magenta circular shape at (460, 123) with radius 15.
; PLAN: r0=460(x), r1=123(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 123
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
