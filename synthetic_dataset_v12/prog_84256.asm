; DESCRIPTION: Creates a purple circular shape at (72, 180) with radius 43.
; PLAN: r0=72(x), r1=180(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 180
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
