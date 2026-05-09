; DESCRIPTION: Creates a magenta circular shape at (413, 159) with radius 54.
; PLAN: r0=413(x), r1=159(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 159
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
