; DESCRIPTION: Creates a magenta circular shape at (426, 101) with radius 19.
; PLAN: r0=426(x), r1=101(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 101
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
