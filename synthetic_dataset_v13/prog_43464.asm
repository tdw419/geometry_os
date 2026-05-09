; DESCRIPTION: Draws a black circle centered at (123, 169) with radius 34.
; PLAN: r0=123(x), r1=169(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 169
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
