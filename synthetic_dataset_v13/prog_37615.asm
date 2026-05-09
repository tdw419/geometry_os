; DESCRIPTION: Creates a purple circular shape at (304, 194) with radius 40.
; PLAN: r0=304(x), r1=194(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 194
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
