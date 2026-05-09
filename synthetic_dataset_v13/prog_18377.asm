; DESCRIPTION: Creates a purple circular shape at (208, 121) with radius 48.
; PLAN: r0=208(x), r1=121(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 121
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
