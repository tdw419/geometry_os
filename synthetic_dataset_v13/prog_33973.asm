; DESCRIPTION: Draws a black circle centered at (133, 169) with radius 50.
; PLAN: r0=133(x), r1=169(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 169
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
