; DESCRIPTION: Creates a purple circular shape at (154, 178) with radius 38.
; PLAN: r0=154(x), r1=178(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 178
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
