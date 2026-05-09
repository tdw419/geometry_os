; DESCRIPTION: Creates a purple circular shape at (340, 153) with radius 22.
; PLAN: r0=340(x), r1=153(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 153
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
