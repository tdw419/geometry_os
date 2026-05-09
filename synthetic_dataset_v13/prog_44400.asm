; DESCRIPTION: Draws a red circle centered at (144, 169) with radius 58.
; PLAN: r0=144(x), r1=169(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 169
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
