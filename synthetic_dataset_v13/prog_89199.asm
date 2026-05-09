; DESCRIPTION: Creates a blue circular shape at (336, 230) with radius 21.
; PLAN: r0=336(x), r1=230(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 230
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
