; DESCRIPTION: Creates a blue circular shape at (455, 64) with radius 19.
; PLAN: r0=455(x), r1=64(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 64
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
