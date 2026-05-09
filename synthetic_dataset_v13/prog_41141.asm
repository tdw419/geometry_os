; DESCRIPTION: Creates a blue circular shape at (14, 240) with radius 14.
; PLAN: r0=14(x), r1=240(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 240
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
