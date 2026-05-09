; DESCRIPTION: Creates a magenta circular shape at (84, 63) with radius 49.
; PLAN: r0=84(x), r1=63(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 63
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
