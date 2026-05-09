; DESCRIPTION: Creates a purple circular shape at (302, 153) with radius 72.
; PLAN: r0=302(x), r1=153(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 153
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
