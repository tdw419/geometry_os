; DESCRIPTION: Creates a purple circular shape at (409, 112) with radius 50.
; PLAN: r0=409(x), r1=112(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 112
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
