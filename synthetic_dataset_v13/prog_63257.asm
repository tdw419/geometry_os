; DESCRIPTION: Creates a magenta circular shape at (451, 24) with radius 13.
; PLAN: r0=451(x), r1=24(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 24
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
