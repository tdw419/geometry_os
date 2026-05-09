; DESCRIPTION: Creates a blue circular shape at (36, 30) with radius 19.
; PLAN: r0=36(x), r1=30(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 30
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
