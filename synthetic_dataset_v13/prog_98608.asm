; DESCRIPTION: Creates a magenta circular shape at (151, 53) with radius 27.
; PLAN: r0=151(x), r1=53(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 53
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
