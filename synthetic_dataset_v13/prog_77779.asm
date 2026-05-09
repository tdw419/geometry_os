; DESCRIPTION: Creates a magenta circular shape at (441, 38) with radius 13.
; PLAN: r0=441(x), r1=38(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 38
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
