; DESCRIPTION: Draws a purple circle centered at (189, 208) with radius 28.
; PLAN: r0=189(x), r1=208(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 208
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
