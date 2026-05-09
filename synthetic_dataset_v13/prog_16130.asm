; DESCRIPTION: Creates a blue circular shape at (350, 30) with radius 22.
; PLAN: r0=350(x), r1=30(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 30
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
