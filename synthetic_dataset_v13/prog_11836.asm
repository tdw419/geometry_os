; DESCRIPTION: Creates a blue circular shape at (336, 44) with radius 14.
; PLAN: r0=336(x), r1=44(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 44
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
