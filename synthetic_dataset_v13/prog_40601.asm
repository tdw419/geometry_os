; DESCRIPTION: Creates a purple circular shape at (328, 145) with radius 24.
; PLAN: r0=328(x), r1=145(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 145
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
