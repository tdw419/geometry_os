; DESCRIPTION: Creates a blue circular shape at (114, 134) with radius 57.
; PLAN: r0=114(x), r1=134(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 134
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
