; DESCRIPTION: Creates a purple circular shape at (263, 165) with radius 77.
; PLAN: r0=263(x), r1=165(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 165
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
