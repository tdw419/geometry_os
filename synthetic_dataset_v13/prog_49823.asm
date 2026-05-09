; DESCRIPTION: Creates a purple circular shape at (433, 178) with radius 75.
; PLAN: r0=433(x), r1=178(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 178
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
