; DESCRIPTION: Creates a magenta circular shape at (191, 81) with radius 68.
; PLAN: r0=191(x), r1=81(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 81
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
