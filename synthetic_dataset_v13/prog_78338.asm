; DESCRIPTION: Creates a magenta circular shape at (77, 84) with radius 49.
; PLAN: r0=77(x), r1=84(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 84
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
