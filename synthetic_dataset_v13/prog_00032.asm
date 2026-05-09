; DESCRIPTION: Creates a blue circular shape at (219, 81) with radius 65.
; PLAN: r0=219(x), r1=81(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 81
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
