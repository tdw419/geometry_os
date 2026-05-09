; DESCRIPTION: Creates a purple circular shape at (50, 143) with radius 37.
; PLAN: r0=50(x), r1=143(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 143
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
