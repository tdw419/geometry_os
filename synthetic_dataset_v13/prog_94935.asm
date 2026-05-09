; DESCRIPTION: Creates a blue circular shape at (147, 117) with radius 33.
; PLAN: r0=147(x), r1=117(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 117
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
