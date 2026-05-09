; DESCRIPTION: Draws a purple circle centered at (290, 218) with radius 36.
; PLAN: r0=290(x), r1=218(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 218
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
