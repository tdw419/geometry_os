; DESCRIPTION: Creates a purple circular shape at (106, 189) with radius 58.
; PLAN: r0=106(x), r1=189(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 189
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
