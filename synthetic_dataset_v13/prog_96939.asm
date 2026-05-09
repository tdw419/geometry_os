; DESCRIPTION: Creates a purple circular shape at (260, 153) with radius 50.
; PLAN: r0=260(x), r1=153(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 153
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
