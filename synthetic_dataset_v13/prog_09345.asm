; DESCRIPTION: Creates a magenta circular shape at (323, 149) with radius 77.
; PLAN: r0=323(x), r1=149(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 149
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
