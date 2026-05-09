; DESCRIPTION: Places a purple circle of radius 69 at center (147, 121).
; PLAN: r0=147(x), r1=121(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 121
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
