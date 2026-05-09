; DESCRIPTION: Draws a yellow circle centered at (418, 169) with radius 66.
; PLAN: r0=418(x), r1=169(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 169
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
