; DESCRIPTION: Creates a purple circular shape at (177, 171) with radius 18.
; PLAN: r0=177(x), r1=171(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 171
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
