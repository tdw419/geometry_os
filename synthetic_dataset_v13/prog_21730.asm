; DESCRIPTION: Creates a purple circular shape at (295, 153) with radius 45.
; PLAN: r0=295(x), r1=153(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 153
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
