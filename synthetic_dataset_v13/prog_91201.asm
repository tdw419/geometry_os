; DESCRIPTION: Creates a purple circular shape at (429, 157) with radius 51.
; PLAN: r0=429(x), r1=157(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 157
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
