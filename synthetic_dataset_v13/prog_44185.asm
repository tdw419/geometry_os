; DESCRIPTION: Creates a magenta circular shape at (448, 78) with radius 46.
; PLAN: r0=448(x), r1=78(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 78
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
