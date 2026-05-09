; DESCRIPTION: Creates a magenta circular shape at (119, 206) with radius 13.
; PLAN: r0=119(x), r1=206(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 206
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
