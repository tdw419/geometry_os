; DESCRIPTION: Creates a purple circular shape at (412, 157) with radius 17.
; PLAN: r0=412(x), r1=157(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 157
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
