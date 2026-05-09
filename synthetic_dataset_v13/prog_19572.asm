; DESCRIPTION: Creates a purple circular shape at (157, 91) with radius 36.
; PLAN: r0=157(x), r1=91(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 91
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
