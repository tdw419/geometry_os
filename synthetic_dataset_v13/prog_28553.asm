; DESCRIPTION: Creates a purple circular shape at (250, 135) with radius 78.
; PLAN: r0=250(x), r1=135(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 135
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
