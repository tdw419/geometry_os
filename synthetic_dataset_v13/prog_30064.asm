; DESCRIPTION: Creates a magenta circular shape at (435, 90) with radius 66.
; PLAN: r0=435(x), r1=90(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 90
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
