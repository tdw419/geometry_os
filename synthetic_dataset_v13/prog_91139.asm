; DESCRIPTION: Draws a black circle centered at (360, 133) with radius 53.
; PLAN: r0=360(x), r1=133(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 133
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
