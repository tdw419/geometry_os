; DESCRIPTION: Creates a purple circular shape at (66, 171) with radius 31.
; PLAN: r0=66(x), r1=171(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 171
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
