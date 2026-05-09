; DESCRIPTION: Creates a magenta circular shape at (265, 124) with radius 16.
; PLAN: r0=265(x), r1=124(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 124
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
