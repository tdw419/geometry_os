; DESCRIPTION: Creates a purple circular shape at (371, 165) with radius 72.
; PLAN: r0=371(x), r1=165(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 165
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
