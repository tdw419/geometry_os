; DESCRIPTION: Creates a purple circular shape at (160, 64) with radius 48.
; PLAN: r0=160(x), r1=64(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 64
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
