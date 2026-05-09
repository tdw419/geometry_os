; DESCRIPTION: Creates a purple circular shape at (96, 215) with radius 34.
; PLAN: r0=96(x), r1=215(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 215
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
