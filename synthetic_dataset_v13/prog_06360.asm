; DESCRIPTION: Creates a purple circular shape at (441, 160) with radius 64.
; PLAN: r0=441(x), r1=160(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 160
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
