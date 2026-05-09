; DESCRIPTION: Creates a magenta circular shape at (413, 36) with radius 14.
; PLAN: r0=413(x), r1=36(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 36
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
