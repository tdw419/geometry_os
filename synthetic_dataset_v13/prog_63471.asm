; DESCRIPTION: Creates a purple circular shape at (474, 101) with radius 32.
; PLAN: r0=474(x), r1=101(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 101
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
