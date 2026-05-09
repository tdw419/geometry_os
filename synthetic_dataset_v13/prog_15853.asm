; DESCRIPTION: Creates a blue circular shape at (316, 160) with radius 45.
; PLAN: r0=316(x), r1=160(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 160
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
