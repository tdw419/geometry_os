; DESCRIPTION: Creates a blue circular shape at (256, 145) with radius 30.
; PLAN: r0=256(x), r1=145(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 145
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
