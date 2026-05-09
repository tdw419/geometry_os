; DESCRIPTION: Creates a magenta circular shape at (273, 157) with radius 68.
; PLAN: r0=273(x), r1=157(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 157
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
