; DESCRIPTION: Places a purple circle of radius 10 at center (50, 104).
; PLAN: r0=50(x), r1=104(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 104
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
