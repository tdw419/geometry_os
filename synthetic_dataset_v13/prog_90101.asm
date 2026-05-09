; DESCRIPTION: Creates a purple circular shape at (228, 100) with radius 66.
; PLAN: r0=228(x), r1=100(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 100
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
