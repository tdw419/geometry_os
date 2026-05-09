; DESCRIPTION: Creates a magenta circular shape at (159, 172) with radius 74.
; PLAN: r0=159(x), r1=172(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 172
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
