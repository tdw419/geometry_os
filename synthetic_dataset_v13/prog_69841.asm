; DESCRIPTION: Creates a magenta circular shape at (369, 83) with radius 57.
; PLAN: r0=369(x), r1=83(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 83
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
