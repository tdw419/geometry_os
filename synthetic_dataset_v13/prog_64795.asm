; DESCRIPTION: Creates a purple circular shape at (487, 135) with radius 18.
; PLAN: r0=487(x), r1=135(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 135
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
