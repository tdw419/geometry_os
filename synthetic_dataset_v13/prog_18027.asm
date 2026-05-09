; DESCRIPTION: Creates a purple circular shape at (211, 184) with radius 71.
; PLAN: r0=211(x), r1=184(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 184
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
