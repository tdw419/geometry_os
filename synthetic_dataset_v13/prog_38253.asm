; DESCRIPTION: Creates a magenta circular shape at (259, 66) with radius 63.
; PLAN: r0=259(x), r1=66(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 66
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
