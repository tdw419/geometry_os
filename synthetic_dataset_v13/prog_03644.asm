; DESCRIPTION: Creates a purple circular shape at (346, 76) with radius 49.
; PLAN: r0=346(x), r1=76(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 76
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
