; DESCRIPTION: Creates a blue circular shape at (336, 157) with radius 71.
; PLAN: r0=336(x), r1=157(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 157
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
