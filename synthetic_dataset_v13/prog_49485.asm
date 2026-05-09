; DESCRIPTION: Creates a purple circular shape at (190, 153) with radius 51.
; PLAN: r0=190(x), r1=153(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 153
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
