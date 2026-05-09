; DESCRIPTION: Creates a purple circular shape at (127, 109) with radius 60.
; PLAN: r0=127(x), r1=109(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 109
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
