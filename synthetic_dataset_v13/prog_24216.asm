; DESCRIPTION: Creates a magenta circular shape at (126, 157) with radius 74.
; PLAN: r0=126(x), r1=157(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 157
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
