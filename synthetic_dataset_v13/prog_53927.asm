; DESCRIPTION: Creates a magenta circular shape at (217, 34) with radius 14.
; PLAN: r0=217(x), r1=34(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 34
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
