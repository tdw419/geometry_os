; DESCRIPTION: Creates a magenta circular shape at (377, 183) with radius 41.
; PLAN: r0=377(x), r1=183(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 183
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
