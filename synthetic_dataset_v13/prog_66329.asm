; DESCRIPTION: Creates a magenta circular shape at (428, 218) with radius 12.
; PLAN: r0=428(x), r1=218(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 218
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
