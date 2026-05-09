; DESCRIPTION: Creates a purple circular shape at (273, 132) with radius 65.
; PLAN: r0=273(x), r1=132(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 132
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
