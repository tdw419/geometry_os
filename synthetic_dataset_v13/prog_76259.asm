; DESCRIPTION: Creates a purple circular shape at (398, 15) with radius 11.
; PLAN: r0=398(x), r1=15(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 15
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
