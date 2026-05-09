; DESCRIPTION: Draws a purple circle centered at (121, 126) with radius 58.
; PLAN: r0=121(x), r1=126(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 126
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
