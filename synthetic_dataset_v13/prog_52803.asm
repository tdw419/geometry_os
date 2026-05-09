; DESCRIPTION: Creates a purple circular shape at (303, 112) with radius 15.
; PLAN: r0=303(x), r1=112(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 112
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
