; DESCRIPTION: Creates a magenta circular shape at (172, 151) with radius 77.
; PLAN: r0=172(x), r1=151(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 151
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
