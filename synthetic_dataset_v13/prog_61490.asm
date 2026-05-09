; DESCRIPTION: Creates a purple circular shape at (352, 193) with radius 63.
; PLAN: r0=352(x), r1=193(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 193
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
