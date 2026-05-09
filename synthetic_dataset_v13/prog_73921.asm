; DESCRIPTION: Draws a black circle centered at (314, 133) with radius 75.
; PLAN: r0=314(x), r1=133(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 133
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
