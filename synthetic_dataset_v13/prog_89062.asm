; DESCRIPTION: Creates a purple circular shape at (213, 82) with radius 16.
; PLAN: r0=213(x), r1=82(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 82
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
