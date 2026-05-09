; DESCRIPTION: Creates a purple circular shape at (225, 184) with radius 66.
; PLAN: r0=225(x), r1=184(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 184
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
