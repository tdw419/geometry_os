; DESCRIPTION: Creates a blue circular shape at (108, 86) with radius 73.
; PLAN: r0=108(x), r1=86(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 86
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
