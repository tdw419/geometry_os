; DESCRIPTION: Creates a purple circular shape at (183, 151) with radius 25.
; PLAN: r0=183(x), r1=151(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 151
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
