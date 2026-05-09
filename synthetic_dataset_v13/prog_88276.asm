; DESCRIPTION: Creates a magenta circular shape at (348, 149) with radius 78.
; PLAN: r0=348(x), r1=149(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 149
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
