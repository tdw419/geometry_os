; DESCRIPTION: Creates a magenta circular shape at (167, 96) with radius 12.
; PLAN: r0=167(x), r1=96(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 96
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
