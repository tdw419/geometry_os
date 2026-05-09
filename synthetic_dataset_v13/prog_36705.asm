; DESCRIPTION: Creates a blue circular shape at (238, 233) with radius 19.
; PLAN: r0=238(x), r1=233(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 233
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
