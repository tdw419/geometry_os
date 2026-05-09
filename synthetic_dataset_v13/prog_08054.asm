; DESCRIPTION: Creates a blue circular shape at (370, 76) with radius 52.
; PLAN: r0=370(x), r1=76(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 76
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
