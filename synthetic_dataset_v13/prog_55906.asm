; DESCRIPTION: Creates a purple circular shape at (329, 106) with radius 36.
; PLAN: r0=329(x), r1=106(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 106
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
