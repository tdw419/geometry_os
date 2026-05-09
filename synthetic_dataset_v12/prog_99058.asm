; DESCRIPTION: Creates a purple circular shape at (324, 164) with radius 21.
; PLAN: r0=324(x), r1=164(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 164
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
