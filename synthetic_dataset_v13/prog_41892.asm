; DESCRIPTION: Draws a purple circle centered at (154, 137) with radius 58.
; PLAN: r0=154(x), r1=137(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 137
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
