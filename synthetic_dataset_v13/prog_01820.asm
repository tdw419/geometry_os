; DESCRIPTION: Creates a purple circular shape at (449, 159) with radius 63.
; PLAN: r0=449(x), r1=159(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 159
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
