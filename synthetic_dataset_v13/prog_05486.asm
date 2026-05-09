; DESCRIPTION: Draws a green circle centered at (325, 169) with radius 12.
; PLAN: r0=325(x), r1=169(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 169
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
