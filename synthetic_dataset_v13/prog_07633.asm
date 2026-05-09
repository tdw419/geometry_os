; DESCRIPTION: Creates a blue circular shape at (238, 63) with radius 58.
; PLAN: r0=238(x), r1=63(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 63
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
