; DESCRIPTION: Creates a magenta circular shape at (151, 204) with radius 19.
; PLAN: r0=151(x), r1=204(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 204
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
