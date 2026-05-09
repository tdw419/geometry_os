; DESCRIPTION: Creates a purple circular shape at (263, 189) with radius 43.
; PLAN: r0=263(x), r1=189(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 189
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
