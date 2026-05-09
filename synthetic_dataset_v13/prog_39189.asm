; DESCRIPTION: Creates a magenta circular shape at (78, 46) with radius 44.
; PLAN: r0=78(x), r1=46(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 46
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
