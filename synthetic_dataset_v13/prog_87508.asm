; DESCRIPTION: Creates a purple circular shape at (210, 153) with radius 24.
; PLAN: r0=210(x), r1=153(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 153
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
