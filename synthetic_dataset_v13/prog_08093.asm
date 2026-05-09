; DESCRIPTION: Creates a magenta circular shape at (222, 77) with radius 71.
; PLAN: r0=222(x), r1=77(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 77
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
