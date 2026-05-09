; DESCRIPTION: Creates a purple circular shape at (164, 157) with radius 59.
; PLAN: r0=164(x), r1=157(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 157
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
