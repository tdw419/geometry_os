; DESCRIPTION: Creates a purple circular shape at (177, 20) with radius 17.
; PLAN: r0=177(x), r1=20(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 20
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
