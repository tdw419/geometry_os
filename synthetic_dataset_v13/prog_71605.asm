; DESCRIPTION: Creates a purple circular shape at (109, 143) with radius 27.
; PLAN: r0=109(x), r1=143(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 143
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
