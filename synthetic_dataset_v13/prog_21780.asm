; DESCRIPTION: Creates a purple circular shape at (425, 160) with radius 64.
; PLAN: r0=425(x), r1=160(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 160
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
