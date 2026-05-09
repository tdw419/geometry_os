; DESCRIPTION: Creates a purple circular shape at (246, 199) with radius 22.
; PLAN: r0=246(x), r1=199(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 199
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
