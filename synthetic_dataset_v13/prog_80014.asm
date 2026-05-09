; DESCRIPTION: Draws a black circle centered at (142, 139) with radius 80.
; PLAN: r0=142(x), r1=139(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 139
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
