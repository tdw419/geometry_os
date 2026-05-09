; DESCRIPTION: Draws a yellow circle centered at (249, 169) with radius 16.
; PLAN: r0=249(x), r1=169(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 169
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
