; DESCRIPTION: Creates a magenta circular shape at (171, 113) with radius 56.
; PLAN: r0=171(x), r1=113(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 113
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
