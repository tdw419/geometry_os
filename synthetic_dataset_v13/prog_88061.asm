; DESCRIPTION: Creates a blue circular shape at (53, 44) with radius 23.
; PLAN: r0=53(x), r1=44(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 44
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
