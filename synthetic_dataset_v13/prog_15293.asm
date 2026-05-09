; DESCRIPTION: Creates a blue circular shape at (89, 81) with radius 27.
; PLAN: r0=89(x), r1=81(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 81
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
