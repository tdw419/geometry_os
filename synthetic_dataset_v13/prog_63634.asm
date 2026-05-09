; DESCRIPTION: Creates a purple circular shape at (121, 188) with radius 10.
; PLAN: r0=121(x), r1=188(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 188
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
