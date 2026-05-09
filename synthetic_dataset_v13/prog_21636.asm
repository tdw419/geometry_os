; DESCRIPTION: Creates a magenta circular shape at (373, 120) with radius 44.
; PLAN: r0=373(x), r1=120(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 120
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
