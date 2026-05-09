; DESCRIPTION: Creates a purple circular shape at (280, 30) with radius 29.
; PLAN: r0=280(x), r1=30(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 30
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
