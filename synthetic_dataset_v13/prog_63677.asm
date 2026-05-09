; DESCRIPTION: Creates a magenta circular shape at (52, 57) with radius 40.
; PLAN: r0=52(x), r1=57(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 57
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
