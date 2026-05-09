; DESCRIPTION: Creates a blue circular shape at (249, 94) with radius 37.
; PLAN: r0=249(x), r1=94(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 94
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
