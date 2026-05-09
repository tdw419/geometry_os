; DESCRIPTION: Creates a purple circular shape at (346, 162) with radius 18.
; PLAN: r0=346(x), r1=162(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 162
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
