; DESCRIPTION: Creates a magenta circular shape at (406, 101) with radius 63.
; PLAN: r0=406(x), r1=101(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 101
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
