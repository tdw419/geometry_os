; DESCRIPTION: Creates a purple circular shape at (188, 167) with radius 21.
; PLAN: r0=188(x), r1=167(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 167
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
