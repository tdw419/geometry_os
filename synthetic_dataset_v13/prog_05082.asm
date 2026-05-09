; DESCRIPTION: Draws a red circle centered at (369, 199) with radius 31.
; PLAN: r0=369(x), r1=199(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 199
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
