; DESCRIPTION: Draws a purple circle centered at (439, 169) with radius 21.
; PLAN: r0=439(x), r1=169(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 169
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
