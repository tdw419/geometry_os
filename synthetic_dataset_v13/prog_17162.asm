; DESCRIPTION: Creates a magenta circular shape at (151, 150) with radius 74.
; PLAN: r0=151(x), r1=150(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 150
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
