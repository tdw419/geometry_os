; DESCRIPTION: Creates a magenta circular shape at (86, 167) with radius 33.
; PLAN: r0=86(x), r1=167(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 167
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
