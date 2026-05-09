; DESCRIPTION: Creates a purple circular shape at (420, 143) with radius 75.
; PLAN: r0=420(x), r1=143(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 143
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
