; DESCRIPTION: Draws a purple circle centered at (260, 169) with radius 58.
; PLAN: r0=260(x), r1=169(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 169
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
