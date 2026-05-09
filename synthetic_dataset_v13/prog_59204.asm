; DESCRIPTION: Creates a purple circular shape at (464, 143) with radius 36.
; PLAN: r0=464(x), r1=143(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 143
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
