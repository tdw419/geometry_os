; DESCRIPTION: Creates a magenta circular shape at (151, 113) with radius 53.
; PLAN: r0=151(x), r1=113(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 113
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
