; DESCRIPTION: Creates a purple circular shape at (346, 84) with radius 45.
; PLAN: r0=346(x), r1=84(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 84
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
