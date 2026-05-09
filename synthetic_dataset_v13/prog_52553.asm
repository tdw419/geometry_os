; DESCRIPTION: Creates a magenta circular shape at (372, 217) with radius 22.
; PLAN: r0=372(x), r1=217(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 217
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
