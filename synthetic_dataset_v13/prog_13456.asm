; DESCRIPTION: Creates a magenta circular shape at (118, 206) with radius 22.
; PLAN: r0=118(x), r1=206(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 206
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
