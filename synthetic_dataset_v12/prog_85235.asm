; DESCRIPTION: Creates a purple circular shape at (433, 113) with radius 26.
; PLAN: r0=433(x), r1=113(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 113
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
