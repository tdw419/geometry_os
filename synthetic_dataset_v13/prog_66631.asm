; DESCRIPTION: Creates a magenta circular shape at (56, 215) with radius 39.
; PLAN: r0=56(x), r1=215(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 215
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
