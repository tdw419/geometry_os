; DESCRIPTION: Creates a purple circular shape at (260, 164) with radius 45.
; PLAN: r0=260(x), r1=164(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 164
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
